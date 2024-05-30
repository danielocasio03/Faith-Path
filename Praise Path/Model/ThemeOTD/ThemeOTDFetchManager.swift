//
//  ThemeOTDFetchManager.swift
//  Praise Path
//
//  Created by Daniel Efrain Ocasio on 3/19/24.
//

import Foundation
import Combine

class ThemeOTDFetchManager {
	
	// Enum to represent possible errors during theme content fetching
	enum ThemeContentFetchError: Error {
		case failedToFormURL
		case failedToFetchThemeContent(error: Error)
	}
	
	// Function to fetch all theme content for a given theme
	func fetchAllThemeContent(theme: String) -> AnyPublisher<[ThemeOTDModel], ThemeContentFetchError> {
		
		// Create publishers for fetching theme content three times
		let publisherOne = fetchSingleContent(theme: theme)
		let publisherTwo = fetchSingleContent(theme: theme)
		let publisherThree = fetchSingleContent(theme: theme)
		
		// Combine the results of the three publishers into a single publisher
		return Publishers.Zip3(publisherOne, publisherTwo, publisherThree)
			.map { (result1, result2, result3) in
				[result1, result2, result3] // Combine the results into an array
			}
			.eraseToAnyPublisher() // Erase the publisher's type for encapsulation
	}
	
	// Function to fetch theme content for a single request
	func fetchSingleContent(theme: String) -> AnyPublisher<ThemeOTDModel, ThemeContentFetchError> {
		
		// Construct the URL for fetching theme content based on the provided theme
		let urlString = "https://getcontext.xyz/api/api.php?query=\(theme)"
		
		// Safely unwrap the optional URL string into a URL object
		guard let url = URL(string: urlString) else {
			// Return a failure publisher if URL formation fails
			return Fail(error: ThemeContentFetchError.failedToFormURL)
				.eraseToAnyPublisher() // Erase the publisher's type for encapsulation
		}
		
		// Create a URLSession dataTaskPublisher to handle the network request
		return URLSession.shared.dataTaskPublisher(for: url)
			.map(\.data) // Extract the data from the tuple emitted by the publisher
			.decode(type: ThemeOTDModel.self, decoder: JSONDecoder()) // Decode JSON data into ThemeOTDModel
			.mapError { error in
				ThemeContentFetchError.failedToFetchThemeContent(error: error) // Map decoding errors
			}
			.receive(on: DispatchQueue.main) // Receive on the main queue for UI updates
			.eraseToAnyPublisher() // Erase the publisher's type for encapsulation
	}
}

//
//  FetchThumbnailFunction.swift
//  Praise Path
//
//  Created by Daniel Efrain Ocasio on 3/21/24.
//

import Foundation
import Combine
import UIKit

class FetchYoutubeAttributes {
	
	// Enum to represent possible errors during theme content fetching
	enum ThumbnailFetchError: Error {
		case failedToFormURL
		case failedToFetchThumbnail(error: Error)
		case invalidImageData
	}
	
	//This function takes in a videoID of type string, and returns a publisher of either UIImage or a fetch error
	static func fetchThumbnail(videoID: String) -> AnyPublisher<UIImage, ThumbnailFetchError> {
		
		//Creating the thumbnail URL from the videoID
		let constructedThumbnail = "https://img.youtube.com/vi/\(videoID)/hqdefault.jpg"
		
		//Safely converting the string into a URL
		guard let thumbnailURL = URL(string: constructedThumbnail) else {
			
			return Fail(error: ThumbnailFetchError.failedToFormURL)
				.eraseToAnyPublisher()
		}
		
		//Fetching from the thumbnail URL object constructed above, and returning the publisher or error
		return URLSession.shared.dataTaskPublisher(for: thumbnailURL)
			.map {$0.data}
			.tryMap { imageData in
				if let image = UIImage(data: imageData) {
					return image
				} else {
					throw ThumbnailFetchError.invalidImageData
				}
			}
			.mapError({ error in
				return ThumbnailFetchError.failedToFetchThumbnail(error: error)
			})
			.receive(on: DispatchQueue.main)
			.eraseToAnyPublisher()
	}
	
	
	
	//This is a function that takes in a regular youtube video URL, and from it extracts the videoID
	static func getVideoID(from youtubeURL: String) -> String? {
		//unwraps the youtubeURL String parameter converting it into a URL; from it extracting its queryItems
		if let url = URL(string: youtubeURL),
		   let queryItems = URLComponents(url: url, resolvingAgainstBaseURL: false)?.queryItems {
			//Takes the queryItems from the youtube video URL and extracts the needed videoID query
			for queryItem in queryItems {
				if queryItem.name == "v",
				   //This is where the videoID is extracted then returne
					let videoID = queryItem.value {
					
					return videoID
					
				}
			}
		}
		//If the above code fails, this function will return nil
		return nil
	}
	
	
}

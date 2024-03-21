//
//  VerseOTDFetchManager.swift
//  Praise Path
//
//  Created by Daniel Efrain Ocasio on 3/8/24.
//

import Foundation
import Combine

class VerseOTDFetchManager {
	
	//Stores the cancellable
	var cancellable = Set<AnyCancellable>()
	
	//Closure used for passing the fetched data back to the VC
	var passVerse: ((VerseOTDModel)-> Void)?
	
	//This function does the fetch for the bible verse
	func fetchVerse() {
		
		let urlString = "https://beta.ourmanna.com/api/v1/get?format=json&order=daily#"
		
		URLSession.shared.dataTaskPublisher(for: URL(string: urlString)!)
			.map(\.data)
			.decode(type: VerseOTDModel.self, decoder: JSONDecoder())
			.sink { response in
				print("Fetch status for daily verse returned \(response)")
			} receiveValue: { data in
				
				guard let safelyPassVerse = self.passVerse else {return}
				safelyPassVerse(data)
				
			}
		
			.store(in: &cancellable)

	}
	
}

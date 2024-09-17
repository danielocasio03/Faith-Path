//
//  BibleBooksFetchManager.swift
//  Praise Path
//
//  Created by Daniel Efrain Ocasio on 6/10/24.
//

import Foundation
import Combine

class BibleBooksFetchManager {
	
	enum BibleBookFetchErrors: Error {
		
		case failedToFormURL(for: String)
		case fetchChaptersFailure(error: Error)
		case fetchScriptureFailure(error: Error)
		
	}
	
	//This is the function that handles fetching the chapters for a given bibleBook and version; returns either a publisher with error or of type BibleChapterModel
	func fetchChaptersForBook(bibleID: String, bookID: String) -> AnyPublisher<BibleChapterModel, BibleBookFetchErrors> {
		
		//Forming the fetch URL String
		let urlString = "https://api.scripture.api.bible/v1/bibles/\(bibleID)/books/\(bookID)/chapters?"
		
		//safely unwrapping URL from urlString; producing an error if theres any issues
		guard let url = URL(string: urlString) else {
			return Fail(error: BibleBookFetchErrors.failedToFormURL(for: "Chapters for book fetch"))
				.eraseToAnyPublisher()
		}
		
		//Adding in the headers
		var requestWithKey = URLRequest(url: url)
		requestWithKey.addValue("00db3e7eec79ac4d78a47aa85b8e5b9b", forHTTPHeaderField: "api-key")
		requestWithKey.setValue("application/json", forHTTPHeaderField: "accept")
		
		//Returns the result of the URLSession
		return URLSession.shared.dataTaskPublisher(for: requestWithKey)
		//Publish the data keypath
			.map(\.data)
		// Add a step to print the raw JSON data
			.handleEvents(receiveOutput: { data in
				if let jsonString = String(data: data, encoding: .utf8) {
					print("Received JSON: \(jsonString)")
				} else {
					print("Failed to convert data to string")
				}
			})
		//decodes the JSON from the BibleChapterModel using JSONDecoder()
			.decode(type: BibleChapterModel.self, decoder: JSONDecoder())
		//If fails in error, maps the error to the error handler enum
			.mapError {BibleBookFetchErrors.fetchChaptersFailure(error: $0)}
			.receive(on: DispatchQueue.main)
			.eraseToAnyPublisher()
	}
	
	func fetchScriptForChapter(bibleID: String, chapterID: String) -> AnyPublisher<BibleScriptureModel, BibleBookFetchErrors>{
		
		//Forming the URL String
		let urlString = "https://api.scripture.api.bible/v1/bibles/\(bibleID)/chapters/\(chapterID)?content-type=html&include-notes=false&include-titles=true&include-chapter-numbers=true&include-verse-numbers=true&include-verse-spans=false"
		
		//Safely unwrapping a URL object created from urlString; producing an error if theres any issues
		guard let url = URL(string: urlString) else {
			return Fail(error: BibleBookFetchErrors.failedToFormURL(for: "Scripture for chapter fetch"))
				.eraseToAnyPublisher()
		}
		
		//Adding in the required headers
		var requestWithKey = URLRequest(url: url)
		requestWithKey.addValue("00db3e7eec79ac4d78a47aa85b8e5b9b", forHTTPHeaderField: "api-key")
		requestWithKey.setValue("application/json", forHTTPHeaderField: "accept")
		
		//Returning the results of the URLSession
		return URLSession.shared.dataTaskPublisher(for: requestWithKey)
		//Publish the data keypath
			.map(\.data)
		//decodes the JSON from the BibleChapterModel using JSONDecoder()
			.decode(type: BibleScriptureModel.self, decoder: JSONDecoder())
		//If fails in error, maps the error to the error handler enum
			.mapError{BibleBookFetchErrors.fetchScriptureFailure(error: $0)}
			.receive(on: DispatchQueue.main)
			.eraseToAnyPublisher()
		
		
	}
	
	
}

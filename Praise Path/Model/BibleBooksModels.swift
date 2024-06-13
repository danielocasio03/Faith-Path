//
//  BibleChapterModel.swift
//  Praise Path
//
//  Created by Daniel Efrain Ocasio on 6/10/24.
//

import Foundation
import Combine

//Model for the fetch that gets all the chapters for a given book and bibleVersion
class BibleChapterModel: Decodable {
	
	let data: [Chapter]
	
	struct Chapter: Decodable {
		
		let id: String
		
		let bibleId: String
		
		let bookId: String
		
		let number: String
		
		let reference: String
		
	}
	
	
	
}

class BibleScriptureModel: Decodable {
	
	
	
}

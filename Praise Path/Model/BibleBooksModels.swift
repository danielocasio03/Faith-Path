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

//Model for fetching all scripture content for a given bibleVersion and chapter
class BibleScriptureModel: Decodable {
	//Scripture Data
	let data: ScriptureData
	
	//Scripture Metadata - like Fair use management systems and info
	let meta: ScriptureMeta
	
	struct ScriptureData: Decodable {
		
		let id: String
		
		let bibleId: String
		
		let number: String
		
		let bookId: String
		
		let reference: String
		
		let content: String
		
		let next: NextPreviousData?
		
		let previous: NextPreviousData?
		
	}
	
	struct NextPreviousData: Decodable {
		
		let id: String
		
		let number: String
		
		let bookId: String
		
	}
	
	struct ScriptureMeta: Decodable {
		
		let fums: String
		
		let fumsId: String
		
		let fumsJsInclude: String
		
		let fumsJs: String
		
		let fumsNoScript: String
		
	}
	
	
}

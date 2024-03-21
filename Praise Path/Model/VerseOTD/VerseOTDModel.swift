//
//  VerseOTDModel.swift
//  Praise Path
//
//  Created by Daniel Efrain Ocasio on 3/8/24.
//

import Foundation

struct VerseOTDModel: Decodable {
	
	let verse: Verse
	
}


struct Verse: Decodable {
	
	let details: Details
	
}

struct Details: Decodable {
	
	let text: String
	
	let reference: String
	
	let version: String
	
}

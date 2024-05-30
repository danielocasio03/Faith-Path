//
//  ThemeOTDModel.swift
//  Praise Path
//
//  Created by Daniel Efrain Ocasio on 3/19/24.
//

import Foundation
import Combine
import UIKit

class ThemeOTDModel: Decodable {
	
	var videoID: String {
		
		guard let youtubeURL = sermon_url else {
			return "Failed to get videoID"
		}
		
		if let safeVideoID = FetchYoutubeAttributes.getVideoID(from: youtubeURL) {
			return safeVideoID
		} else {
			return "Failed to Form VideoID"
		}
		
	}
	
	let verse_category: String
	
	let verse_reference: String
	
	let verse_content: String
	
	let sermon_url: String?
	
}

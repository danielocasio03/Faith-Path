//
//  StoredDataManager.swift
//  Praise Path
//
//  Created by Daniel Efrain Ocasio on 6/3/24.
//

import Foundation
import CoreData
class StoredDataManager {
	
	// MARK: - Bible Version Handling
	
	//Defines an array that will hold the preloaded bibleversions, that will populate coredata stores if there was never any stored BibleVersionData
	private var preloadedBibleVersions: [(abbreviation: String, name: String, id: String, isSelected: Bool)] = [
		(abbreviation: "AMP", name: "Amplified Bible", id: "N/A", isSelected: false),
		(abbreviation: "NASB", name: "New American Standard Bible 2020", id: "N/A", isSelected: true),
		(abbreviation: "ASV", name: "American Standard Version", id: "06125adad2d5898a-01", isSelected: false),
		(abbreviation: "KJV", name: "King James Version", id: "de4e12af7f28f599-02", isSelected: false),
		(abbreviation: "BSB", name: "Berean Standard Bible", id: "bba9f40183526463-01", isSelected: false),
		(abbreviation: "FBV", name: "Free Bible Version", id: "65eec8e0b60e656b-01", isSelected: false),
		(abbreviation: "LSV", name: "Literal Standard Version", id: "01b29f4b342acc35-01", isSelected: false),
		(abbreviation: "WEB", name: "World English Bible", id: "9879dbb7cfe39e4d-04", isSelected: false)
	]

	
	//This function fetches the BibleVersion data store and returns its contents, if empty it preloads BibleVersions and stores it in context. Then returns the context
	func fetchBibleVersions() -> [BibleVersion] {
		//Reference to the BibleVersion's fetch request method
		let fetchRequest = BibleVersion.fetchRequest()
		
		// Tries to fetch from the BibleVersion context, if fails, the catch block provides the error
		do {
			//fetches existing BibleVersions from the context
			var existingVersions = try AppDelegate.context.fetch(fetchRequest)
			
			//Checks if existing Bibleversions is empty, if it is it creates a BibleVersion object from each item in preloadedBibleVersion and saves it to context. This way BibleVersions always exist in store
			if existingVersions.isEmpty {
				print("No BibleVersions found in context, creating and saving preloaded BibleVersions")
				//create a BibleVersion for each object in preloadedBibleVersions
				for version in preloadedBibleVersions {
					let newVersion = BibleVersion(context: AppDelegate.context)
					newVersion.abbreviation = version.abbreviation
					newVersion.name = version.name
					newVersion.id = version.id
					newVersion.isSelected = version.isSelected
				}
				// Save Bible versions created above into context
				try AppDelegate.context.save()
				print("Bible versions saved into context.")
				//With preloaded versions now created and saved, refetches from context and returns the contents
				existingVersions = try AppDelegate.context.fetch(fetchRequest)
				print("Now returning newly created context with \(existingVersions.count) versions")
				return existingVersions
			} else {
				//This else block catches the scenario where versions already exist in store and do not need to be preloaded. Returning the already existing store to bibleVersionsSave
				print("Bible versions already exist in context, returning \(existingVersions.count) versions")
				return existingVersions
			}
			//This is the catch if the initial fetch from coredata fails
		} catch {
			print("Failed to fetch Bible versions: \(error)")
			return []
		}
	}
	
}

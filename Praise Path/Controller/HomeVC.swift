//
//  ViewController.swift
//  Praise Path
//
//  Created by Daniel Efrain Ocasio on 2/20/24.
//

import UIKit
import Combine

class HomeVC: UIViewController {
	
	//MARK: - Declarations
	
	let homeView = HomeView()
	
	let verseOTDManager = VerseOTDFetchManager()
	
	let themeOTDManager = ThemeOTDFetchManager()
	
	private var cancellables = Set<AnyCancellable>()
	
	
	//MARK: - Life Cycle Functions
	
	override func viewDidLoad() {
		super.viewDidLoad()
		viewSetup()
		themeOTDHandler()
		verseOTDHandler()
	}
	
	
	//MARK: - View Controller Functions
	
	
	//This function handles the fetch and passing of the ThemeOTD data
	func themeOTDHandler() {
		
		themeOTDManager.fetchAllThemeContent(theme: "stress")
			.sink { completion in
				switch completion {
					//If the completion status comes back finished, do nothing
				case .finished:
					break
					//If the completion status comes back in failure, handle the error
				case .failure(let error):
					print("Failed to fetch theme content with error \(error)")
				}
				//Data handling; passing on the data to class methods for handling
			} receiveValue: { [weak self] data in
				guard let self = self else {return}
				updateThemeOTD(itemData: data)
			}
			.store(in: &cancellables)
		
	}
	
	//This takes in all three of the objects fetched, and assigns it to created subviews
	func updateThemeOTD(itemData: [ThemeOTDModel]) {
		
		//creation of all three arrangedSubviews for the theme content stack
		let themeOTDItemOne = ThemeOTDItemView()
		let itemDataOne = itemData[0]
		
		let themeOTDItemTwo = ThemeOTDItemView()
		let itemDataTwo = itemData[1]
		
		let themeOTDItemThree = ThemeOTDItemView()
		let itemDataThree = itemData[2]

		//itemOne data to UI update
		themeOTDItemOne.youtubePlayer.load(videoId: itemDataOne.videoID)
		themeOTDItemOne.verseLabel.text = itemData[0].verse_content
		themeOTDItemOne.verseReferenceLabel.text = itemData[0].verse_reference
		homeView.themeOTDView.stackView.addArrangedSubview(themeOTDItemOne)
		
		//itemTwo data to UI update
		themeOTDItemTwo.youtubePlayer.load(videoId: itemDataTwo.videoID)
		themeOTDItemTwo.verseLabel.text = itemData[1].verse_content
		themeOTDItemTwo.verseReferenceLabel.text = itemData[1].verse_reference
		homeView.themeOTDView.stackView.addArrangedSubview(themeOTDItemTwo)
		
		//ItemThree data to UI update
		themeOTDItemThree.youtubePlayer.load(videoId: itemDataThree.videoID)
		themeOTDItemThree.verseLabel.text = itemData[2].verse_content
		themeOTDItemThree.verseReferenceLabel.text = itemData[2].verse_reference
		homeView.themeOTDView.stackView.addArrangedSubview(themeOTDItemThree)
		
	}
	
	
	//This function handles the fetch and passing of the VerseOTD data to the function that updates the UI
	func verseOTDHandler() {
		//Fetch
		verseOTDManager.fetchVerse()
		//Data Pass
		verseOTDManager.passVerse = { [weak self] data in
			
			guard let self = self else {return}
			updateVerseOTD(verse: data.verse.details)
			
		}
	}
	
	
	//This function handles updating the screen with the fetched VerseOTD data
	func updateVerseOTD(verse: Details) {
		
		//updating the verseOTD UI, and doing so on the main thread
		DispatchQueue.main.async { [weak self] in
			guard let self = self else {return}
			homeView.verseOTDView.bibleVerse.text = verse.text
			homeView.verseOTDView.verseReference.text = "\(verse.reference) · \(verse.version)"
			
		}
		
	}
	
	//General View setup, adding in the homeview and setting its constraints
	func viewSetup() {
		
		view.addSubview(homeView)
		
		NSLayoutConstraint.activate([
			
			homeView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
			homeView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
			homeView.topAnchor.constraint(equalTo: view.topAnchor),
			homeView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
		
		])
		
	}


}


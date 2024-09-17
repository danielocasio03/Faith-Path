//
//  ReaderVC.swift
//  Praise Path
//
//  Created by Daniel Efrain Ocasio on 5/8/24.
//

import Foundation
import UIKit
import Combine

class ScriptureVC: UIViewController {
	
	//MARK: - Declarations
	
	let scriptureView = ScriptureView()
	
	var savedVersions: [BibleVersion]
	
	var scriptureForChapter: BibleScriptureModel
	
	let bibleBooksFetchManager = BibleBooksFetchManager()
	
	let storedDataManager = StoredDataManager()
	
	private var cancellables = Set<AnyCancellable>()

	//Declartion of the Navigation Bars Buttons
	//Declaration of the backButton that goes on the left side of the navigation bar
	lazy var backButton: UIBarButtonItem = {
		//Gets the book name from the fetched reference
		let bookName = scriptureForChapter.data.reference
			.replacingOccurrences(of: "\\d+", with: "", options: .regularExpression)
			.trimmingCharacters(in: .whitespacesAndNewlines)
		
		//Initializes a button from ScriptureNavButton class, passing in the book name above as the buttons title
		let button = ScriptureNavButton(buttonTitle: bookName)
		button.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
		
		//Setting the button created above as the customView for the barButton then returning
		let barButton = UIBarButtonItem(customView: button)
		
		return barButton
	}()
	
	//Declaration of the chapterButton that goes on the center of the navigation bar
	lazy var chapterButton: UIButton = {
		//Initializes a button from ScriptureNavButton class, passing in the chapter number for the on screen scripture
		let button = ScriptureNavButton(buttonTitle: "Chapter \(scriptureForChapter.data.number)")
		button.addTarget(self, action: #selector(chapterButtonTapped), for: .touchUpInside)
		
		return button
	}()

	//Declaration of the versonButton that goes on the center of the navigation bar
	lazy var versionButton: UIButton = {
		//gets the currently selected BibleVersion from the array that references saved context
		guard let versionAbbreviation = savedVersions.first(where: {$0.isSelected == true})?.abbreviation else {
			return ScriptureNavButton(buttonTitle:"Error")}
		
		//Initializes a button from ScriptureNavButton class, passing in the version from above
		let button = ScriptureNavButton(buttonTitle: versionAbbreviation)
		button.addTarget(self, action: #selector(versionButtonTapped), for: .touchUpInside)
		
		return button
	}()
	
	//Declaration of the preferences button thaqt goes on the right side of the navigation bar
	lazy var preferencesButton: UIBarButtonItem = {
		
		//Initializes a button from ScriptureNavButton class, with an empty string; trimming whitespace so nothing is set in
		let button = ScriptureNavButton(buttonTitle: "".trimmingCharacters(in: .whitespacesAndNewlines))
		button.addTarget(self, action: #selector(preferencesButtonTapped), for: .touchUpInside)
		
		//Create a configuration for the SF symbol image set for this button
		let imageConfig = UIImage.SymbolConfiguration(pointSize: 14, weight: .medium)
		let imageForButton = UIImage(systemName: "textformat", withConfiguration: imageConfig)?.withTintColor(DesignManager.shared.darkGrayTextColor, renderingMode: .alwaysOriginal)
		button.setImage(imageForButton, for: .normal)
		
		//Setting the button created above as the customView for the barButton then returning
		let barButton = UIBarButtonItem(customView: button)
		
		return barButton
	}()
	
	//MARK: - Override & Init
	
	//Initialize with the fetched content for this screen
	init(passedScriptureData: BibleScriptureModel, savedVersions: [BibleVersion]){
		//storing the passed in scriptureData to a  constant within the class
		scriptureForChapter = passedScriptureData
		self.savedVersions = savedVersions
		super.init(nibName: nil, bundle: nil)
	}
	
	
	//viewDidLoad
	override func viewDidLoad() {
		super.viewDidLoad()
		setupNav()
		setupView()
		
	}
	
	
	//MARK: - Setup Functions
	
	func setupNav() {
		//Setting the nav to not use large titles and hide the nav on swipe gesture
		self.navigationItem.largeTitleDisplayMode = .never
		self.navigationController?.hidesBarsOnSwipe = true
		
		//Creating and assigning the navAppearance
		let scriptureNavAppearance = UINavigationBarAppearance()
		scriptureNavAppearance.backgroundColor = DesignManager.shared.darkBackgroundColor
		self.navigationController?.navigationBar.standardAppearance = scriptureNavAppearance
		self.navigationController?.navigationBar.scrollEdgeAppearance = scriptureNavAppearance
		
		//Nav button logic
		//Adding the declared and defined back button to the navbar
		self.navigationItem.leftBarButtonItem = backButton
		// Create a container view for the center buttons consisting of the chapterButton and Version Button
		let centerView = UIStackView(arrangedSubviews: [chapterButton, versionButton])
		centerView.axis = .horizontal
		centerView.spacing = 2
		centerView.alignment = .center
		centerView.distribution = .fillProportionally
		// Assign the container view to the titleView
		self.navigationItem.titleView = centerView
		//Adding in the declared and defined font button
		self.navigationItem.rightBarButtonItem = preferencesButton
	}
	
	//General setup of the view
	func setupView() {
		
		view.addSubview(scriptureView)
		//Loading the fetched content into the loaderView
		DispatchQueue.main.async { [weak self] in
			guard let self = self else {return}
			self.scriptureView.scriptureLoaderView.loadScripture(content: self.scriptureForChapter.data.content)
		}
		
		NSLayoutConstraint.activate([
			scriptureView.topAnchor.constraint(equalTo: view.topAnchor),
			scriptureView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
			scriptureView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
			scriptureView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
		])
	}
	
	//Helper function called to reload the scripture with updated chapter info
	func reloadScripture(selectedChapterData: AnyPublisher<BibleScriptureModel, BibleBooksFetchManager.BibleBookFetchErrors>) {
		
		//Attaching the publisher to a subscriber
		selectedChapterData
			.receive(on: DispatchQueue.main)
			.sink { completion in
				print("Scripture for selected chapter fetch returned \(completion)")
				
			} receiveValue: { [weak self] chapterData in
				guard let self = self else {return}
				//updating the local ScriptureForChapter variable with the new data
				self.scriptureForChapter = chapterData
				//Loading the fetched content into the loaderView
				self.scriptureView.scriptureLoaderView.loadScripture(content: scriptureForChapter.data.content)
				//updating the nav's chapterButton with the new chapter
				(self.chapterButton as? ScriptureNavButton)?.setupButton(buttonTitle: "Chapter \(scriptureForChapter.data.number)")
			}
			.store(in: &cancellables)
	}
	
	func handleVersionUpdate(index: Int) {
		//Getting ahold of the selectedVerion, using the passed in index on the savedVersions array
		let selectedVersion = savedVersions[index]
		//unwrapping optional strings abbreviation and id
		guard let abbreivation = selectedVersion.abbreviation,
			  let versionid = selectedVersion.id else {return}
		
		//Fetching for the scripture using the new versionid and chapter
		bibleBooksFetchManager.fetchScriptForChapter(bibleID: versionid, chapterID: scriptureForChapter.data.id)
			.receive(on: DispatchQueue.main)
			.sink { completion in
				print("Scripture for selected version fetch returned \(completion)")
				
			} receiveValue: { [weak self] scriptureData in
				guard let self = self else {return}
				//Reassigning scriptureForChapter to be the newly fetched scriptureData
				self.scriptureForChapter = scriptureData
				//Loading the new scriptureData in the scriptureLoaderView
				self.scriptureView.scriptureLoaderView.loadScripture(content: scriptureData.data.content)
			}
			.store(in: &cancellables)

		
		
		//Use the passed in index to update the versionSelectButton label with the selected bibleVersion
		(self.versionButton as? ScriptureNavButton)?.setupButton(buttonTitle: abbreivation)
		//Finds the item that was previously selected and sets its isSelected property to false
		savedVersions.first(where: {$0.isSelected == true})?.isSelected = false
		//Using the passed index, set the newly selected version's isSelected property true
		savedVersions[index].isSelected = true
		//save context
		do {
			try AppDelegate.context.save()
		} catch {
			print("Failed to save \(error)")
		}
		
		
		
	}
	
	
	//MARK: - Action Functions
	
	//Action function called when the back button on the nav is tapped
	@objc func backButtonTapped() {
	
		self.navigationController?.popViewController(animated: true)
		
	}
	
	//Action function called when the chapter button on the nav is tapped
	@objc func chapterButtonTapped(){
		
		//Gets the selected bibleID based off what is stored in context
		guard let selectedBibleID = savedVersions.first(where: { $0.isSelected })?.id else {return}
		
		//Fetches for the chapters of the provided bibleID and bookID, then attaches a subscriber to handle the completion and data
		//The .sink operator takes the fetched chapters data and passes it to the chapterSelectVC presenting it thereafter
		bibleBooksFetchManager.fetchChaptersForBook(bibleID: selectedBibleID, bookID: scriptureForChapter.data.bookId)
			.sink(receiveCompletion: { completion in
				print("Chapters for book fetch returned with status \(completion)")
				
			}, receiveValue: { [weak self] data in
				//Safely unwrapping weak self; mitigating any retain cycles
				guard let self = self else {return}
				//Initializing chapterSelectVC with the fetched chapterData then presenting
				let chapterSelectVC = ChapterSelectVC(chapterData: data.data)
				self.present(chapterSelectVC, animated: true)
				//Defining pass scripture to pass its underlying data to reloadScripture for handling of the fetched data
				chapterSelectVC.passScripture = {data in
					self.reloadScripture(selectedChapterData: data)
				}
			
			})
			.store(in: &cancellables)
	}
	
	//Action Function called when the version button on the nav is tapped
	@objc func versionButtonTapped(){
		
		//initializing versionSelectVC
		let versionSelectVC = VersionSelectVC()
		//passing in the savedVersions
		versionSelectVC.savedVersions = savedVersions
		
		//Defining passNewVersion via closure to pass in the recieved data to a helper method in this class handleVersionUpdate,
		versionSelectVC.passNewVersion = { [weak self] data in
			guard let self = self else {return}
			self.handleVersionUpdate(index: data)
		}
		
		//presenting versionSelectVC
		self.present(versionSelectVC, animated: true)
	}
	
	
	//Action Function called when the preferences button on the nav is tapped
	@objc func preferencesButtonTapped() {
		//Fetches for the saved preferences from context and stores the result in a safely unwrapped constant
		guard let savedPreferences = storedDataManager.fetchScripturePreferences().first else {
			print("Error presenting preferencesVC with saved preferences")
			return
		}
		//Initializes preferencesVC passing in the aboved fetched savedPreferences then presents
		let preferencesVC = PreferencesVC(savedPreferences: savedPreferences)
		self.present(preferencesVC, animated: true)
		
		preferencesVC.didChangePreference = { [weak self] in
			guard let self = self else {return}
			self.scriptureView.scriptureLoaderView.loadScripture(content: scriptureForChapter.data.content)
		
		}
		
	}
	
	
	
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
}

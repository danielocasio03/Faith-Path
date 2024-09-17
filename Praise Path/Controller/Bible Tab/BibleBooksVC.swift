//
//  BibleVC.swift
//  Praise Path
//
//  Created by Daniel Efrain Ocasio on 4/21/24.
//

import Foundation
import UIKit
import Combine

class BibleBooksVC: UIViewController {
	
	//MARK: - Declarations
	
	let searchController = UISearchController(searchResultsController: nil)
	
	let bibleBooksView = BibleBooksView()
	
	let storedDataManager = StoredDataManager()
	
	lazy var savedVersions: [BibleVersion] = []
	
	let bibleBooksFetchManager = BibleBooksFetchManager()
	
	private var cancellables = Set<AnyCancellable>()
	
	//Create Version Button
	lazy var versionSelectButton: BookVersionButton = {
		//Get the current selected bible version and create the BookVersionButton with its abbreviation
		let selectedAbbreviation = savedVersions.first(where: {$0.isSelected})?.abbreviation
		let button = BookVersionButton(version: selectedAbbreviation!, with: UIColor.systemGray)
		return button
	}()
	
	//MARK: - Override func
	
	//View Did Load
	override func viewDidLoad() {
		super.viewDidLoad()
		fetchBibleVersions()
		setupView()
		setupCollectionView()
		setupSearch()
	}
	
	//ViewWillAppear -  We use ViewWillAppear here to reset the navController as changes are made to it in the scriptureVC
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(true)
		
		//Resetting the version select button in case it was changed at any point
		let selectedAbbreviation = savedVersions.first(where: {$0.isSelected})?.abbreviation
		self.versionSelectButton.setupButton(version: selectedAbbreviation!, with: UIColor.systemGray)
		
		// Create a custom nav bar appearance
		let bibleNavAppearance = UINavigationBarAppearance()
		bibleNavAppearance.titleTextAttributes = [NSAttributedString.Key.font: DesignManager.shared.appFontMedium!.withSize(20)]
		bibleNavAppearance.largeTitleTextAttributes = [NSAttributedString.Key.font: DesignManager.shared.appFontSemiBold!, .foregroundColor: DesignManager.shared.systemWhite]
		bibleNavAppearance.backgroundEffect = UIBlurEffect(style: .dark)
		// Apply the custom appearance to the navigation bar
		self.navigationController?.navigationBar.standardAppearance = bibleNavAppearance
		self.navigationController?.navigationBar.scrollEdgeAppearance = nil
		//Changes to other properties of the nav
		self.navigationController?.navigationBar.prefersLargeTitles = true
		self.navigationItem.largeTitleDisplayMode = .always
		self.navigationController?.hidesBarsOnSwipe = false
		
		
	}
	
	//MARK: - Setup Functions
	
	//This function handles fetching for all the BibleVersions saved in context, and creating a reference to them in this VC
	func fetchBibleVersions() {
		
		savedVersions = storedDataManager.fetchBibleVersions()
		
	}
	
	//Function for general setup of the view
	func setupView() {
		self.view.addSubview(bibleBooksView)
		
		//Version Button: Add the versionSelectButton to the NavBar
		let barButtonItem = UIBarButtonItem(customView: versionSelectButton)
		navigationItem.rightBarButtonItem = barButtonItem
		//Add action to the button making it to where when tapped the versionButtonTapped function is called
		versionSelectButton.addTarget(self, action: #selector(versionButtonTapped), for: .touchUpInside)
		
		NSLayoutConstraint.activate([
			bibleBooksView.topAnchor.constraint(equalTo: self.view.topAnchor),
			bibleBooksView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
			bibleBooksView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
			bibleBooksView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
		])
	}
	
	//Action function for the Version Button; called when the button is tapped
	@objc func versionButtonTapped() {
		// Create the VersionSelectVC passing in the savedVersions Array
		let versionSelectVC = VersionSelectVC()
		versionSelectVC.savedVersions = savedVersions
		//Define the passNewVersion variable from versionSelectVC, allowing us to call back the selected index. Then passed to the helper function to update the view and save context
		versionSelectVC.passNewVersion = { [weak self] index in
			guard let self = self else {return}
			self.handleVersionUpdate(index: index)
		}
		
		//present versionSelectVC
		self.present(versionSelectVC, animated: true)
	}
	
	
	//Helper function that takes the index of the newly selected version
	func handleVersionUpdate(index: Int) {
		
		//Use the passed in index to update the versionSelectButton label with the selected bibleVersion
		versionSelectButton.setupButton(version: savedVersions[index].abbreviation!, with: UIColor.systemGray)
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
	
	
	//Handles the creation and presentation of scripture VC with the scriptureData
	func handleScriptureVC(selectedChapterData: AnyPublisher<BibleScriptureModel, BibleBooksFetchManager.BibleBookFetchErrors>) {
		//Attaching the publisher to a subscriber
		selectedChapterData
			.receive(on: DispatchQueue.main)
			.sink { completion in
				print("Scripture for selected chapter fetch returned \(completion)")
				
			} receiveValue: { [weak self] chapterData in
				guard let self = self else {return}
				//Initializing scriptureVC with the scripture data and pushing it onto the navigation stack
				let scriptureVC = ScriptureVC(passedScriptureData: chapterData, savedVersions: savedVersions)
				self.navigationController?.pushViewController(scriptureVC, animated: true)
			}
			.store(in: &cancellables)
	}
	
}


//MARK: - EXT: UICollectionView

extension BibleBooksVC: UICollectionViewDelegate, UICollectionViewDataSource {
	
	//general setup of the collectionview
	func setupCollectionView() {
		bibleBooksView.booksCollectionView.dataSource = self
		bibleBooksView.booksCollectionView.delegate = self
		bibleBooksView.booksCollectionView.register(BookItemCell.self, forCellWithReuseIdentifier: "customCell")
	}
	
	//number of items in each section
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return 3
	}
	
	//number of sections
	func numberOfSections(in collectionView: UICollectionView) -> Int {
		return DesignManager.shared.tableOfContentsDict.count/3
	}
	
	//cellForItemAt
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		//creating the cell for the Bookcollectionview using the BookItemCell
		let cell = bibleBooksView.booksCollectionView.dequeueReusableCell(withReuseIdentifier: "customCell", for: indexPath) as! BookItemCell
		//captures the section path
		let section = indexPath.section
		//captures the item path
		let item = indexPath.item
		//gets the book for cell using the section and item as keys for the tableOfContents dictionary in designManager
		guard let bookForCell = DesignManager.shared.tableOfContentsDict[[section: item]]?.1 else {
			return cell
		}
		//Sets the cells properties using bookForcell
		cell.bookImage.image = UIImage(named: bookForCell)
		cell.bookTitle.text = bookForCell
		
		return cell
	}
	
	//didSelectItemAt
	func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
		//captures the selected index section and item
		let section = indexPath.section
		let item = indexPath.item
		
		//Gets the Selected book data from the tableOfContents Dictionary using the index of the selected item
		guard let selectedBook = DesignManager.shared.tableOfContentsDict[[section: item]]?.0 else {
			print("issues finding selected book")
			return
		}
		
		//Gets the selected bibleID based off what is stored in context
		guard let selectedBibleID = savedVersions.first(where: { $0.isSelected })?.id else {return}
		
		//Fetches for the chapters of the provided bibleID and bookID, then attaches a subscriber to handle the completion and data
		//The .sink operator takes the fetched chapters data and passes it to the chapterSelectVC presenting it thereafter
		bibleBooksFetchManager.fetchChaptersForBook(bibleID: selectedBibleID, bookID: selectedBook)
			.sink(receiveCompletion: { completion in
				print("Chapters for book fetch returned with status \(completion)")
				
			}, receiveValue: { [weak self] data in
				//Safely unwrapping weak self; mitigating any retain cycles
				guard let self = self else {return}
				//Initializing chapterSelectVC with the fetched chapterData then presenting
				let chapterSelectVC = ChapterSelectVC(chapterData: data.data)
				self.present(chapterSelectVC, animated: true)
				//Defining passScripture to pass the data over to the data handler method handleScriptureVC
				chapterSelectVC.passScripture = { data in
					self.handleScriptureVC(selectedChapterData: data)
				}
			})
			.store(in: &cancellables)
			
	}
	
	
}


//MARK: - EXT: SearchBarController
//Extension for the SearchController displayed in the NavBar
extension BibleBooksVC: UISearchResultsUpdating {
	
	//updateSearchfor
	func updateSearchResults(for searchController: UISearchController) {
		print("test")
	}
	
	//search bar setup
	func setupSearch() {
		searchController.searchBar.placeholder = "Search by Book Name"
		searchController.searchResultsUpdater = self
		self.navigationItem.hidesSearchBarWhenScrolling = false
		self.navigationItem.searchController = searchController
		
		
	}
	
}

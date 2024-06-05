//
//  BibleVC.swift
//  Praise Path
//
//  Created by Daniel Efrain Ocasio on 4/21/24.
//

import Foundation
import UIKit

class BibleBooksVC: UIViewController {
	
	//MARK: - Declarations
		
	let searchController = UISearchController(searchResultsController: nil)
	
	//Adding in the view
	let bibleBooksView = BibleBooksView()
	
	let storedDataManager = StoredDataManager()
	
	lazy var savedVersions: [BibleVersion] = []
	
	//Create Version Button
	lazy var versionSelectButton: BookVersionButton = {
		//Get the current selected bible version and create the BookVersionButton with its abbreviation
		let selectedAbbreviation = savedVersions.first(where: {$0.isSelected})?.abbreviation
		let button = BookVersionButton(version: selectedAbbreviation!)
			return button
		
		
	}()
	
	//MARK: - Override func
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		fetchBibleVersions()
		setupView()
		setupCollectionView()
		setupSearch()
		
	}
	
	
	//MARK: - Setup Functions
	
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
			guard let safeSelf = self else {return}
			safeSelf.handleVersionUpdate(index: index)
		}
		
		//present versionSelectVC
		self.present(versionSelectVC, animated: true)
	}
	
	
	//Helper function that takes the index of the newly selected version
	func handleVersionUpdate(index: Int) {
		
		//Use the passed in index to update the versionSelectButton label with the selected bibleVersion
		versionSelectButton.setupButton(version: savedVersions[index].abbreviation!)
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
	
	
	
}


//MARK: - UICollectionView

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
		
		let cell = bibleBooksView.booksCollectionView.dequeueReusableCell(withReuseIdentifier: "customCell", for: indexPath) as! BookItemCell
		let section = indexPath.section
		let item = indexPath.item
		guard let cellForBook = DesignManager.shared.tableOfContentsDict[[section: item]] else {
			cell.bookImage.image = UIImage(named: "Genesis")
			cell.bookTitle.text = "Genesis"
			return cell
		}
		
		cell.bookImage.image = UIImage(named: cellForBook)
		cell.bookTitle.text = cellForBook
		
		return cell
		
	}
	
	//didSelectItemAt
	func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
		let section = indexPath.section
		let item = indexPath.item
		
		guard let selectedBook = DesignManager.shared.tableOfContentsDict[[section: item]] else {
			print("issues finding selected book")
			return
		}
		let scriptureVC = ScriptureVC()
		scriptureVC.title = "\(selectedBook) Chapter 1"
		
		scriptureVC.navigationController?.isNavigationBarHidden = false
		navigationController?.pushViewController(scriptureVC, animated: true)
	}
	
}

//MARK: - SearchBarController
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

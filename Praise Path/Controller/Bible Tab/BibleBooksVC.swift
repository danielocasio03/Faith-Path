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
	
	let bibleBooksView = BibleBooksView()
	
	
	
	//MARK: - Override func
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		setupView()
		setupCollectionView()
		setupSearch()
		
	}
	
	
	//MARK: - Setup Functions
	
	//Function for general setup of the view
	func setupView() {
		
		self.view.addSubview(bibleBooksView)
		
		//Version Button: Create and add to Navbar
		let versionButton = BookVersionButton(version: "NKJV")
		let barButtonItem = UIBarButtonItem(customView: versionButton)
		navigationItem.rightBarButtonItem = barButtonItem
		versionButton.addTarget(self, action: #selector(versionButtonTapped), for: .touchUpInside)
		
		NSLayoutConstraint.activate([
		
			bibleBooksView.topAnchor.constraint(equalTo: self.view.topAnchor),
			bibleBooksView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
			bibleBooksView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
			bibleBooksView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),

		])
	}
	
	//Action function for the Version Button
	@objc func versionButtonTapped() {
		
		print("button tapped")
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

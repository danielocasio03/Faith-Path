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
	
	let bibleView = BibleView()
	
	
	
	//MARK: - Override func
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		setupView()
		setupCollectionView()
		setupSearch()
		
	}
	
	//MARK: - Setup Functions
	
	func setupView() {
		
		self.view.addSubview(bibleView)
		
		NSLayoutConstraint.activate([
		
			bibleView.topAnchor.constraint(equalTo: self.view.topAnchor),
			bibleView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
			bibleView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
			bibleView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),

		])
		
	}
	
}

//MARK: - UICollectionView

extension BibleBooksVC: UICollectionViewDelegate, UICollectionViewDataSource {
	
	//general setup of the collectionview
	func setupCollectionView() {
		
		bibleView.booksCollectionView.dataSource = self
		bibleView.booksCollectionView.delegate = self
		bibleView.booksCollectionView.register(BookItemCell.self, forCellWithReuseIdentifier: "customCell")
		
	}
	
	//number of items in each section
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return 3
	}
	
	//number of sections
	func numberOfSections(in collectionView: UICollectionView) -> Int {
//		return designManager.tableOfContentsDict.count/3
		return 22
	}
	
	//cellForItemAt
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		
		let cell = bibleView.booksCollectionView.dequeueReusableCell(withReuseIdentifier: "customCell", for: indexPath) as! BookItemCell
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
		let readerVC = ScriptureVC()
		readerVC.title = selectedBook
		readerVC.navigationController?.isNavigationBarHidden = false
		navigationController?.pushViewController(readerVC, animated: true)
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

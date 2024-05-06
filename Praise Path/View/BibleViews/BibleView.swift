//
//  BibleView.swift
//  Praise Path
//
//  Created by Daniel Efrain Ocasio on 4/23/24.
//

import Foundation
import UIKit

class BibleView: UIView {
	
	//MARK: - Declarations
	
	let designManager = DesignManager()
	
	
	
	//The label for the screen title
	lazy var screenTitleLabel: UILabel = {
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		label.text = designManager.greeting
		label.font = designManager.appFontSemiBold
		label.textColor = designManager.systemWhite
		label.text = "Bible Books"
		return label
		}()
	
		//Search bar which will be used to search for the books
	lazy var customSearchBar: UISearchBar = {
		
		let searchBar = UISearchBar()
		searchBar.translatesAutoresizingMaskIntoConstraints = false
		searchBar.placeholder = "Search For a Book"
		searchBar.searchBarStyle = .minimal
		return searchBar
	}()
	
	//Collection view for the bible books
	lazy var booksCollectionView: UICollectionView = {
		let collectionView = UICollectionView(frame: .zero, collectionViewLayout: BibleView.collectionLayoutSetup())
		collectionView.translatesAutoresizingMaskIntoConstraints = false
		collectionView.backgroundColor = .clear
		return collectionView
	}()

	
	//MARK: - Overrides
	
	//Override Init
	override init(frame: CGRect) {
		super.init(frame: frame)
		
		translatesAutoresizingMaskIntoConstraints = false
		setupView()
		
		
	}
	
	//Override layoutSubviews
	override func layoutSubviews() {
		super.layoutSubviews()
		
		//Setup of the background gradient for the HomeView
		let backgroundGradient = designManager.homeScreenGradient
		backgroundGradient.frame = self.bounds
		self.layer.insertSublayer(backgroundGradient, at: 0)
		
	}
	
	//MARK: - View Setup Functions
	
	func setupView() {
		self.addSubview(screenTitleLabel)
		self.addSubview(customSearchBar)
		self.addSubview(booksCollectionView)
		
		
		NSLayoutConstraint.activate([
			//screenTitleLabel
			screenTitleLabel.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 20),
			screenTitleLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 30),
			//searchBar
			customSearchBar.topAnchor.constraint(equalTo: self.screenTitleLabel.bottomAnchor, constant: 20),
			customSearchBar.leadingAnchor.constraint(equalTo: self.screenTitleLabel.leadingAnchor),
			customSearchBar.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -20),
			//booksCollectionView
			booksCollectionView.topAnchor.constraint(equalTo: customSearchBar.bottomAnchor, constant: 25),
			booksCollectionView.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 15),
			booksCollectionView.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -15),
			booksCollectionView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor),
		])
		
	}
	
	
	//Bible collection view layout setup
	static func collectionLayoutSetup() -> UICollectionViewLayout {
		
		//Item
		let item = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(
			widthDimension: .fractionalWidth(0.333), heightDimension: .fractionalHeight(1)))
		item.contentInsets = NSDirectionalEdgeInsets(top: 12, leading: 12, bottom: 12, trailing: 12)
		
		
		//Group
		let group = NSCollectionLayoutGroup.horizontal(
			layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(0.32)),
			subitems: [item]
		)
		
		//Sections
		let section = NSCollectionLayoutSection(group: group)
		section.orthogonalScrollingBehavior = .continuous
		
		return UICollectionViewCompositionalLayout(section: section)
		
		
	}
	
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
}

//
//  BibleView.swift
//  Praise Path
//
//  Created by Daniel Efrain Ocasio on 4/23/24.
//

import Foundation
import UIKit

class BibleBooksView: UIView {
	
	//MARK: - Declarations
		
	//Collection view for the bible books
	lazy var booksCollectionView: UICollectionView = {
		let collectionView = UICollectionView(frame: .zero, collectionViewLayout: BibleBooksView.collectionLayoutSetup())
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
		
		//Setup of the background gradient for the BibleView
		let lightGradientColor = UIColor(red: 35/255, green: 42/255, blue: 50/255, alpha: 1.0)
		let darkGradientColor = UIColor(red: 9/255, green: 12/255, blue: 16/255, alpha: 1.0)
		let gradient = CAGradientLayer()
		gradient.colors = [lightGradientColor.cgColor, darkGradientColor.cgColor]
		gradient.startPoint = CGPoint(x: 0, y: 0)
		gradient.endPoint = CGPoint(x: 0.5, y: 1.0)
		gradient.frame = self.bounds
		self.layer.insertSublayer(gradient, at: 0)
		
	}
	
	//MARK: - View Setup Functions
	
	func setupView() {
		self.addSubview(booksCollectionView)
		
		
		NSLayoutConstraint.activate([
			booksCollectionView.topAnchor.constraint(equalTo: self.topAnchor),
			booksCollectionView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 15),
			booksCollectionView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -15),
			booksCollectionView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
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
			layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(0.2)),
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

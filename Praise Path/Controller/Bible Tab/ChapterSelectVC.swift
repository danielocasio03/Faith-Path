//
//  ChapterSelectVC.swift
//  Praise Path
//
//  Created by Daniel Efrain Ocasio on 6/10/24.
//

import Foundation
import UIKit
import Combine

class ChapterSelectVC: UIViewController {
	
	let bibleBooksFetchManager = BibleBooksFetchManager()
	
	var passScripture: ((AnyPublisher<BibleScriptureModel, BibleBooksFetchManager.BibleBookFetchErrors>)-> Void)?
	
	private var cancellables = Set<AnyCancellable>()
	
	//MARK: - Declarations
	
	//The label for the title of this VC
	lazy var titleLabel: UILabel = {
		
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		label.textColor = DesignManager.shared.darkGrayTextColor.withAlphaComponent(1)
		label.font = DesignManager.shared.appFontSemiBold!.withSize(25)
		
		return label
	}()
	
	//created the SubTitleLabel; which will appear just below the titleLabel
	lazy var subTitleLabel: UILabel = {
		
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		label.text = "Chapter Select"
		label.textColor = DesignManager.shared.darkGrayTextColor.withAlphaComponent(0.70)
		label.font = DesignManager.shared.appFontMedium!.withSize(21)
		
		return label
	}()
	
	//Collection view for the bible books
	lazy var chapterCollectionView: UICollectionView = {
		let collectionView = UICollectionView(frame: .zero, collectionViewLayout: collectionLayoutSetup())
		collectionView.translatesAutoresizingMaskIntoConstraints = false
		collectionView.backgroundColor = .clear
		return collectionView
	}()
	
	//Declaration of a variable to hold the chapterData
	var chapterData: [BibleChapterModel.Chapter]
	
	//MARK: -  Init and Override

	//Custom Initializer for taking in the chapterData
	init(chapterData: [BibleChapterModel.Chapter]) {
		//Taking the injected chapterData and capturing it in our local variable chapterData
		self.chapterData = chapterData
		super.init(nibName: nil, bundle: nil)
		titleLabel.text = chapterData.first?.reference

		
	}
	
	//ViewDidLoad
	override func viewDidLoad() {
		super.viewDidLoad()
		
		setupView()
		setupCollectionView()
		
	}
	
	//req init
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	
	
	//MARK: - Setup Functions
	
	//Function for setting the view up
	func setupView() {
		
		//Sets the background color to the dark theme
		self.view.backgroundColor = DesignManager.shared.darkBackgroundColor
		
		// Define custom detent slightly higher than medium and lower than large
		let customDetent = UISheetPresentationController.Detent.custom { context in
			return context.maximumDetentValue * 0.80
		}
		//Use detents so the VC only comes up about halfway, also enabling the grabber to be shown
		self.sheetPresentationController?.detents = [customDetent]
		self.sheetPresentationController?.prefersGrabberVisible = true
		
		//Adds in the controller SubtitleLabel
		self.view.addSubview(titleLabel)
		//Adds in the controller SubtitleLabel
		self.view.addSubview(subTitleLabel)
		
		NSLayoutConstraint.activate([
			//titleLabel
			titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
			titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
			//subTitleLabel
			subTitleLabel.centerXAnchor.constraint(equalTo: titleLabel.centerXAnchor),
			subTitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 7)
			
		])
	}
	
}

//MARK: - EXT: CollectionView

extension ChapterSelectVC: UICollectionViewDelegate, UICollectionViewDataSource {
	
	//Setup of the chapterCollectionView - delegate, datasource, cell, positioning
	func setupCollectionView() {
		self.view.addSubview(chapterCollectionView)
		chapterCollectionView.delegate = self
		chapterCollectionView.dataSource = self
		chapterCollectionView.register(ChapterItemCell.self, forCellWithReuseIdentifier: "cell")
		
		NSLayoutConstraint.activate([
			chapterCollectionView.topAnchor.constraint(equalTo: subTitleLabel.bottomAnchor, constant: 20),
			chapterCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
			chapterCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
			chapterCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
		])
		
	}
	
	
	//Chapter Collection view layout setup
	func collectionLayoutSetup() -> UICollectionViewLayout {
		
		//Item
		let item = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(
			widthDimension: .fractionalWidth(0.2), heightDimension: .fractionalHeight(1)))
		//item insets
		item.contentInsets = NSDirectionalEdgeInsets(top: 20, leading: 10, bottom: 10, trailing: 10)
		
		//Group
		let group = NSCollectionLayoutGroup.horizontal(
			layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(0.17)),
			subitems: [item]
		)
		
		//Sections
		let section = NSCollectionLayoutSection(group: group)
		section.orthogonalScrollingBehavior = .continuous
		
		return UICollectionViewCompositionalLayout(section: section)
	}
	
	//CollectionView numberOfItemsInSection
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		// We use 'remainingItems' to calculate exactly how many items are left to be displayed in the current 'section'.
		// For example, if there are 30 items total (chapterData.count = 30) and the collection view is attempting to layout section 2:
		// At this point, 10 items have already been laid out (5 items per section * 2 sections = 10 items).
		// So, we subtract 10 from the total count (30 - 10) to get 20 items remaining to be laid out.
		let remainingItems = chapterData.count - section * 5
		
		// Return the lower value between 'remainingItems' and 5.
		// This ensures that if the remaining items are fewer than 5, we only return the remaining number of items.
		// Otherwise, we return 5, as each section can hold up to 5 items.
		return min(remainingItems, 5)
	}
	
	//CollectionView numberOfSectionss
	func numberOfSections(in collectionView: UICollectionView) -> Int {
		//Divides chapterData.count by 5 to get the needed amount of sections
		//Uses Ceil to round up in case its a decimal number, to ensure if theres an extra section for remaining items less than 5
		return Int(ceil(Double(chapterData.count) / 5.0))
	}
	
	//CollectionView cellForItemAt
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let cell = chapterCollectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! ChapterItemCell
		//multiplies the section * 5 since there are 5 items per section, then adds the current row to gather exactly which item we are on
		let chapterIndex = indexPath.section * 5 + indexPath.row
		//Sets the exact item number to the label
		cell.numberLabel.text = chapterData[chapterIndex].number
		
		return cell
		
	}
	
	//CollectionView didSelectItemAt
	func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
		
		//captures the index of the selected chapter
		let selectedChapterIndex = indexPath.section * 5 + indexPath.row
		//gets the selectedChapter using the selected index
		let selectedChapter = chapterData[selectedChapterIndex]
		print(selectedChapter)
		
		//Unwrapping the passScripture variable
		guard let safelyPassScripture = passScripture else {return}
		//Calling safelyPassScripture with the publisher inside. Will be defined in BibleBooksVS so the data can be retrieve
		safelyPassScripture(bibleBooksFetchManager.fetchScriptForChapter(bibleID: selectedChapter.bibleId, chapterID: selectedChapter.id))
		//Dismissing chapterSelectVC
		self.dismiss(animated: true)
	}
	
	
	
	
	
	
}


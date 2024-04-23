//
//  ThemeOTDItemView.swift
//  Praise Path
//
//  Created by Daniel Efrain Ocasio on 3/17/24.
//

import Foundation
import UIKit
//ThemeOTDItemView is represents each item in the themeOTD stack
class ThemeOTDItemView: UIView {
	
	//MARK: - Declarations
	
	let designManager = DesignManager()
	
	//This houses and loads the fetched youtube video
	lazy var youtubePlayer: YoutubePlayer = {
		
		let youtubePlayer = YoutubePlayer()
		youtubePlayer.translatesAutoresizingMaskIntoConstraints = false
		youtubePlayer.layer.cornerRadius = 10
		youtubePlayer.clipsToBounds = true
		return youtubePlayer
		
	}()
	
	lazy var verseLabel: UILabel = {
		
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		label.font = designManager.appFontMedium?.withSize(12)
		label.textColor = designManager.systemWhite.withAlphaComponent(0.75)
		label.numberOfLines = 100
		label.lineBreakMode = .byWordWrapping
		label.textAlignment = .center
		return label
		
	}()
	
	lazy var verseReferenceLabel: UILabel = {
		
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		label.font = designManager.appFontMedium?.withSize(12)
		label.textColor = designManager.systemWhite.withAlphaComponent(0.65)
		label.textAlignment = .center
		return label
		
	}()
	
	
	//MARK: - Override Initializer
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		
		setupView()
		
	}
	
	
	//MARK: - View Setup Functions
	
	//Function that adds in and positions the items subviews
	func setupView() {
		
		self.translatesAutoresizingMaskIntoConstraints = false
		self.backgroundColor = .clear
		self.addSubview(verseLabel)
		self.addSubview(verseReferenceLabel)
		self.addSubview(youtubePlayer)
		
		NSLayoutConstraint.activate([
			//youtubePlayer Constraints
			youtubePlayer.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
			youtubePlayer.centerYAnchor.constraint(equalTo: self.centerYAnchor),
			youtubePlayer.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.90),
			youtubePlayer.trailingAnchor.constraint(equalTo: self.centerXAnchor, constant: 30),
			//verseLabel Constraints
			verseLabel.leadingAnchor.constraint(equalTo: youtubePlayer.trailingAnchor, constant: 10),
			verseLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -5),
			verseLabel.centerYAnchor.constraint(equalTo: youtubePlayer.centerYAnchor),
			//verseReference Constraints
			verseReferenceLabel.topAnchor.constraint(equalTo: verseLabel.bottomAnchor, constant: 10),
			verseReferenceLabel.centerXAnchor.constraint(equalTo: verseLabel.centerXAnchor),
			
		])
		
	}
	
	
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	
}

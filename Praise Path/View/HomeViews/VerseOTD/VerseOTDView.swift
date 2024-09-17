//
//  VerseOTDView.swift
//  Praise Path
//
//  Created by Daniel Efrain Ocasio on 3/6/24.
//

import Foundation
import UIKit

class VerseOTDView: UIView {
	
	//MARK: - Declarations
	
	//Label that holds the title for the VerseOTD Section
	lazy var verseSectionLabel: UILabel = {
		
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		label.font = DesignManager.shared.appFontSemiBold?.withSize(17)
		label.text = "Verse Of The Day"
		label.textColor = DesignManager.shared.systemWhite
		
		return label
	}()
	
	//This is the border for the VerseOTD Container
	lazy var containerBorder: UIView = {
		
		let view = UIView()
		view.backgroundColor = .clear
		view.translatesAutoresizingMaskIntoConstraints = false
		view.layer.cornerRadius = 25
		view.layer.borderColor = DesignManager.shared.grayBlack.cgColor
		view.layer.borderWidth = 2
		
		return view
		
	}()
	
	//containerView UIView to hold the content for the VerseOTDView
	lazy var containerView: UIView = {
		
		let view = UIView()
		view.translatesAutoresizingMaskIntoConstraints = false
		view.backgroundColor = .clear
		view.layer.cornerRadius = 20
		view.clipsToBounds = true
		
		return view
	}()
	
	//The ImageView for the Christian Image background for the VerseOTDView
	lazy var christianImage: UIImageView = {
		
		let image = UIImageView()
		image.translatesAutoresizingMaskIntoConstraints = false
		
		if let usedImage = DesignManager.shared.christianImages.randomElement() {
			image.image = usedImage
		} else {
			image.image = DesignManager.shared.christianImages[0]
		}

		image.contentMode = .scaleAspectFill
		
		return image
	}()
	
	//Overlay to tint down the image to a slightly darker shade
	lazy var imageOverlay: UIView = {
		
		let view = UIView()
		view.translatesAutoresizingMaskIntoConstraints = false
		view.backgroundColor = DesignManager.shared.overlayColor
		view.layer.cornerRadius = 20
		
		return view
	}()
	
	//The verse reference is the Book, Chapter and Verse number
	lazy var verseReference: UILabel = {
		
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		label.textColor = DesignManager.shared.systemWhite.withAlphaComponent(0.65)
		label.font = DesignManager.shared.appFontSemiBold?.withSize(14)
		
		return label
		
	}()
	
	//This is the Label to hold the actual verse
	lazy var bibleVerse: UILabel = {
		
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		label.textColor = DesignManager.shared.systemWhite.withAlphaComponent(0.75)
		label.font = DesignManager.shared.appFontSemiBold?.withSize(15)
		label.numberOfLines = 100
		label.lineBreakMode = .byWordWrapping
		label.textAlignment = .center
		
		return label
		
	}()
	
	
	//MARK: - Override init
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		
		setupView()
		setupContainerView()
		setupOverlay()
		
	}
	
	
	//MARK: - Setup functions
	
	//Setup of the view
	func setupView() {
		
		self.translatesAutoresizingMaskIntoConstraints = false
		self.backgroundColor = .clear
		
		addSubview(verseSectionLabel)
		
		NSLayoutConstraint.activate([
			
			verseSectionLabel.topAnchor.constraint(equalTo: self.topAnchor),
			verseSectionLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 25),
		
		])
	}
	
	
	//Setup of the container view
	func setupContainerView() {
		
		self.addSubview(containerBorder)
		self.addSubview(containerView)
		containerView.addSubview(christianImage)
				
		
		NSLayoutConstraint.activate([
			
			containerView.topAnchor.constraint(equalTo: verseSectionLabel.bottomAnchor,constant: 17),
			containerView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
			containerView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
			containerView.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.75),
			
			containerBorder.topAnchor.constraint(equalTo: containerView.topAnchor,constant: -4),
			containerBorder.bottomAnchor.constraint(equalTo: containerView.bottomAnchor,constant: 4),
			containerBorder.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: -4),
			containerBorder.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: 4),

			christianImage.topAnchor.constraint(equalTo: containerView.topAnchor),
			christianImage.bottomAnchor.constraint(equalTo: containerView.bottomAnchor),
			christianImage.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
			christianImage.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
		
		])
	}
	
	//Setup of the overlay that goes over the image with a tint and bible verse
	func setupOverlay() {
		
		containerView.addSubview(imageOverlay)
		imageOverlay.addSubview(verseReference)
		imageOverlay.addSubview(bibleVerse)
		
		
		NSLayoutConstraint.activate([
			
		imageOverlay.topAnchor.constraint(equalTo: containerView.topAnchor),
		imageOverlay.bottomAnchor.constraint(equalTo: containerView.bottomAnchor),
		imageOverlay.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
		imageOverlay.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
		
		verseReference.centerXAnchor.constraint(equalTo: imageOverlay.centerXAnchor),
		verseReference.centerYAnchor.constraint(equalTo: imageOverlay.centerYAnchor, constant: -40),
		
		bibleVerse.centerXAnchor.constraint(equalTo: imageOverlay.centerXAnchor),
		bibleVerse.topAnchor.constraint(equalTo: verseReference.topAnchor, constant: 25),
		bibleVerse.leadingAnchor.constraint(equalTo: imageOverlay.leadingAnchor, constant: 20),
		bibleVerse.trailingAnchor.constraint(equalTo: imageOverlay.trailingAnchor, constant: -20),

		])

	}
	
	
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
}

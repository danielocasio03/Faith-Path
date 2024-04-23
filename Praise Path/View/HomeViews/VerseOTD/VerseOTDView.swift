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
	
	let designManager = DesignManager()
	
	lazy var verseSectionLabel: UILabel = {
		
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		label.font = designManager.appFontSemiBold?.withSize(17)
		label.text = "Verse Of The Day"
		label.textColor = designManager.systemWhite
		
		return label
	}()
	
	lazy var containerBorder: UIView = {
		
		let view = UIView()
		view.backgroundColor = .clear
		view.translatesAutoresizingMaskIntoConstraints = false
		view.layer.cornerRadius = 25
		view.layer.borderColor = designManager.borderColor.cgColor
		view.layer.borderWidth = 2
		
		return view
		
	}()
	
	
	lazy var containerView: UIView = {
		
		let view = UIView()
		view.translatesAutoresizingMaskIntoConstraints = false
		view.backgroundColor = .clear
		view.layer.cornerRadius = 20
		view.clipsToBounds = true
		
		return view
	}()
	
	
	lazy var christianImage: UIImageView = {
		
		let image = UIImageView()
		image.translatesAutoresizingMaskIntoConstraints = false
		
		if let usedImage = designManager.christianImages.randomElement() {
			image.image = usedImage
		} else {
			image.image = designManager.christianImages[0]
		}

		image.contentMode = .scaleAspectFill
		
		return image
	}()
	
	
	lazy var imageOverlay: UIView = {
		
		let view = UIView()
		view.translatesAutoresizingMaskIntoConstraints = false
		view.backgroundColor = designManager.overlayColor
		view.layer.cornerRadius = 20
		
		return view
	}()
	
	lazy var verseReference: UILabel = {
		
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		label.text = ""
		label.textColor = designManager.systemWhite.withAlphaComponent(0.65)
		label.font = designManager.appFontSemiBold?.withSize(14)
		
		return label
		
	}()
	
	lazy var bibleVerse: UILabel = {
		
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		label.text = ""
		label.textColor = designManager.systemWhite.withAlphaComponent(0.75)
		label.font = designManager.appFontSemiBold?.withSize(15)
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

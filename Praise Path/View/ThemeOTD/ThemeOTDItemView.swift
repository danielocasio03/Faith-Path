//
//  ThemeOTDItemView.swift
//  Praise Path
//
//  Created by Daniel Efrain Ocasio on 3/17/24.
//

import Foundation
import UIKit

class ThemeOTDItemView: UIView {
	
	//MARK: - Declarations
	
	let colorManager = ColorManager()
	
	lazy var sermonThumbnail: UIImageView = {
		
		let image = UIImageView()
		image.translatesAutoresizingMaskIntoConstraints = false
		image.contentMode = .scaleToFill
		image.layer.cornerRadius = 20
		image.clipsToBounds = true
		image.image = UIImage(named: "Test Thumbnail")
		
		return image
	}()
	
	lazy var verseLabel: UILabel = {
		
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		label.font = colorManager.appFontMedium?.withSize(13)
		label.textColor = colorManager.systemWhite
		label.numberOfLines = 100
		label.lineBreakMode = .byWordWrapping
		label.textAlignment = .center
		label.text = "Testing the verse label with randomefefwf wef"
		return label
		
	}()
	
	lazy var verseReferenceLabel: UILabel = {
		
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		label.font = colorManager.appFontMedium?.withSize(12)
		label.textColor = colorManager.systemWhite
		label.textAlignment = .center
		label.text = "Testing Verse Reference"
		return label
		
	}()
	
	
	//MARK: - Override Initializer
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		
		setupView()
		
	}
	
	
	//MARK: - View Setup Functions
	
	func setupView() {
		
		self.translatesAutoresizingMaskIntoConstraints = false
		self.backgroundColor = .clear
		
		self.addSubview(sermonThumbnail)
		self.addSubview(verseLabel)
		self.addSubview(verseReferenceLabel)
		
		NSLayoutConstraint.activate([
		
			sermonThumbnail.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
			sermonThumbnail.centerYAnchor.constraint(equalTo: self.centerYAnchor),
			sermonThumbnail.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.90),
			sermonThumbnail.trailingAnchor.constraint(equalTo: self.centerXAnchor, constant: 10),
			
			
			verseLabel.leadingAnchor.constraint(equalTo: self.centerXAnchor, constant: 10),
			verseLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor),
			verseLabel.centerYAnchor.constraint(equalTo: sermonThumbnail.centerYAnchor),
			
			verseReferenceLabel.topAnchor.constraint(equalTo: verseLabel.bottomAnchor, constant: 10),
			verseReferenceLabel.centerXAnchor.constraint(equalTo: verseLabel.centerXAnchor),
			
		
		])
		
	}
	
	
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	
}

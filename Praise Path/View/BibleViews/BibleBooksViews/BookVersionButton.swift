//
//  BibleBooksVersionButton.swift
//  Praise Path
//
//  Created by Daniel Efrain Ocasio on 5/29/24.
//

import Foundation
import UIKit

class BookVersionButton: UIButton {
	
	//Init - Takes a version string so that upon creation the users currently set version will be set as the label
	init(version: String, with color: UIColor) {
		super.init(frame: .zero)
		
		setupButton(version: version, with: color)
		
	}
	
	//Setup the visuals and configuration for the button; taking in a version name parameter to represent the current selected Bible Version
	func setupButton(version: String, with color: UIColor) {
		
		translatesAutoresizingMaskIntoConstraints = false
		//Setup of the buttons appearance
		var buttonConfig = UIButton.Configuration.plain()
		//Button Text
		var attributedText = AttributedString(version)
		attributedText.font = DesignManager.shared.appFontSemiBold?.withSize(16)
		attributedText.foregroundColor = color
		buttonConfig.attributedTitle = attributedText
		//Button Background
		buttonConfig.background.visualEffect = UIBlurEffect(style: .systemUltraThinMaterialDark)
		buttonConfig.cornerStyle = .large
		buttonConfig.contentInsets = NSDirectionalEdgeInsets(top: 8, leading: 25, bottom: 8, trailing: 25)
		//apply configuration
		self.configuration = buttonConfig

	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	
}


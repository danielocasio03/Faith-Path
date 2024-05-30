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
	init(version: String) {
		super.init(frame: .zero)
		
		setupButton(version: version)
		
	}
	
	func setupButton(version: String) {
		
		translatesAutoresizingMaskIntoConstraints = false
		//Setup of the buttons appearance
		var buttonConfig = UIButton.Configuration.filled()
		//Button Text
		var attributedText = AttributedString(version)
		attributedText.font = DesignManager.shared.appFontSemiBold?.withSize(16)
		attributedText.foregroundColor = UIColor.systemGray
		buttonConfig.attributedTitle = attributedText
		//Button Background
		buttonConfig.baseBackgroundColor = DesignManager.shared.grayBlack
		buttonConfig.cornerStyle = .large
		buttonConfig.contentInsets = NSDirectionalEdgeInsets(top: 8, leading: 20, bottom: 8, trailing: 20)
		//apply configuration
		self.configuration = buttonConfig

		
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	
}

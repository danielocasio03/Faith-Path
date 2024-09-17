//
//  ScriptureNavButton.swift
//  Praise Path
//
//  Created by Daniel Efrain Ocasio on 6/26/24.
//

import Foundation
import UIKit

class ScriptureNavButton: UIButton {
	
	//Init - Initializer, taking in the string to be set as the buttons textLabel
	init(buttonTitle: String) {
		super.init(frame: .zero)
		
		setupButton(buttonTitle: buttonTitle)
		
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	func setupButton(buttonTitle: String) {
		
		//Text for the button
		var attributedText = AttributedString(buttonTitle)
		attributedText.font = DesignManager.shared.appFontSemiBold?.withSize(15)
		attributedText.foregroundColor = DesignManager.shared.darkGrayTextColor
		
		//Button customization via UIButton Config
		var buttonConfig = UIButton.Configuration.filled()
		buttonConfig.attributedTitle = attributedText
		buttonConfig.baseBackgroundColor = DesignManager.shared.darkItemColor
		buttonConfig.contentInsets = NSDirectionalEdgeInsets(top: 8, leading: 15, bottom: 8, trailing: 15)
		self.configuration = buttonConfig
		
	}
	
	
}

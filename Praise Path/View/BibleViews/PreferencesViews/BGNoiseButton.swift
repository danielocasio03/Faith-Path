//
//  bgNoiseButton.swift
//  Praise Path
//
//  Created by Daniel Efrain Ocasio on 8/19/24.
//

import Foundation
import UIKit

class BGNoiseButton: UIButton {
	
	
	//MARK: - Declarations
	
	//This is the declaration for the menu displayed when the user taps the button
	lazy var soundsMenu: UIMenu = {
		let option1 = UIAction(title: "White Noise", handler: { _ in print("White Noise selected") })
		let option2 = UIAction(title: "Dark Noise", handler: { _ in print("Dark Noise selected") })
		let option3 = UIAction(title: "Ocean", handler: { _ in print("Ocean Sounds selected") })
		let option4 = UIAction(title: "Rain", handler: { _ in print("Rain selected") })
		let option5 = UIAction(title: "Off", handler: { _ in print("Off selected") })
		return UIMenu(title: "Background Sounds", children: [option1, option2, option3, option4])
	}()
	
	
	//MARK: - Override Init
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		
		setupButton()
		
	}
	
	//MARK: - Setup Functions
	
	func setupButton() {
		
		//Button Customization
		var config = UIButton.Configuration.plain()
		self.translatesAutoresizingMaskIntoConstraints = false
		self.backgroundColor = DesignManager.shared.darkItemColor
		self.tintColor = DesignManager.shared.darkGrayTextColor
		
		config.image = UIImage(systemName: "waveform")
		
		self.configuration = config
		self.menu = soundsMenu
		self.showsMenuAsPrimaryAction = true

	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
}

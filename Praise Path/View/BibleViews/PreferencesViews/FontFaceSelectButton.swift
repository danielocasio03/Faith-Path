//
//  FontFaceSelectButton.swift
//  Praise Path
//
//  Created by Daniel Efrain Ocasio on 7/16/24.
//

import Foundation
import UIKit

class FontFaceSelectButton: UIButton {
	
	//MARK: - Declarations
	
	//Weak reference to PreferencesVC (made it a weak reference to avoid a retain cycle)
	weak var preferencesVC: PreferencesVC?
	
	//This is the declaration of the title for the button; in this case "Font"
	let buttonName: UILabel = {
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		label.text = "Font"
		label.font = DesignManager.shared.appFontMedium?.withSize(10)
		label.textColor = DesignManager.shared.darkGrayTextColor.withAlphaComponent(0.5)
		
		return label
	}()
	
	//This is the declaration for the menu displayed when the user taps the button
	lazy var fontOptionsMenu: UIMenu = {
		//All options call the fontSelected notifier function when tapped, passing in the name of the font selected
		let avenir = UIAction(title: "Avenir", handler: { [weak self] _ in self?.fontSelected(fontSystemName: "Avenir") })
		let arial = UIAction(title: "Arial", handler: { [weak self] _ in self?.fontSelected(fontSystemName: "Arial") })
		let baskerville = UIAction(title: "Baskerville", handler: { [weak self] _ in self?.fontSelected(fontSystemName: "Baskerville") })
		let futura = UIAction(title: "Futura", handler: { [weak self] _ in self?.fontSelected(fontSystemName: "Futura") })
		let georgia = UIAction(title: "Georgia", handler: { [weak self] _ in self?.fontSelected(fontSystemName: "Georgia") })
		let optima = UIAction(title: "Optima", handler: { [weak self] _ in self?.fontSelected(fontSystemName: "Optima") })
		let palatino = UIAction(title: "Palatino", handler: { [weak self] _ in self?.fontSelected(fontSystemName: "Palatino") })
		let verdana = UIAction(title: "Verdana", handler: { [weak self] _ in self?.fontSelected(fontSystemName: "Verdana") })
		return UIMenu(title: "Font Options", children: [avenir, arial, baskerville, futura, georgia, optima, palatino, verdana])
	}()
	
	
	//MARK: - Override Init
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		
		setupButton()
		
	}
	
	//MARK: - Setup Functions
	
	//General button setup
	func setupButton() {
		
		//Button Customization
		self.translatesAutoresizingMaskIntoConstraints = false
		self.backgroundColor = DesignManager.shared.darkItemColor
		self.menu = fontOptionsMenu
		self.showsMenuAsPrimaryAction = true
		//Adding in the buttonTitle label
		self.addSubview(buttonName)
		NSLayoutConstraint.activate([
			//Button Title Constraints
			buttonName.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
			buttonName.topAnchor.constraint(equalTo: self.topAnchor, constant: 5),

			
			
		])
	}
	
	//This method handles setting the font name displayed by the button
	func setupButtonTitle(fontSystemName: String){

		//Title Label
		var config = UIButton.Configuration.plain()
		var attributedText = AttributedString("\(fontSystemName)")
		attributedText.font = UIFont(name: "\(fontSystemName)", size: 20)
		attributedText.foregroundColor = DesignManager.shared.darkGrayTextColor
		config.attributedTitle = attributedText
		config.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)
		self.configuration = config
	}
	
	
	//MARK: - Action functions
	
	//Function called when a menu item is selected
	func fontSelected(fontSystemName: String) {
		//Update the buttons title ie. the font name shown
		setupButtonTitle(fontSystemName: fontSystemName)
		//Call update preferences so that the context is updated with this new font, and the webview is reloaded with it
		preferencesVC?.updatePreferences(for: "fontName", value: fontSystemName)
		
	}
	
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	
	
}

//
//  FontAndSettingsVC.swift
//  Praise Path
//
//  Created by Daniel Efrain Ocasio on 7/11/24.
//

import Foundation
import UIKit

class PreferencesVC: UIViewController {
	
	//MARK: - Declarations
	
	//The label for the title of this VC
	lazy var titleLabel: UILabel = {
		
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		label.textColor = DesignManager.shared.darkGrayTextColor
		label.font = DesignManager.shared.appFontSemiBold?.withSize(28)
		label.text = "Preferences"
		
		return label
	}()
	
	
	//MARK: - Init and Override
	
	//ViewDidLoad
	override func viewDidLoad() {
		super.viewDidLoad()
		
		setupView()
		
	}
	
	//MARK: - Setup Functions
	
	//Function for setting the view up
	func setupView() {
		
		//Sets the background color to the dark theme
		self.view.backgroundColor = DesignManager.shared.darkBackgroundColor
		
		// Define custom detent slightly higher than medium and lower than large
		let customDetent = UISheetPresentationController.Detent.custom { context in
			return context.maximumDetentValue * 0.50
		}
		//Use detents so the VC only comes up about halfway, also enabling the grabber to be shown
		self.sheetPresentationController?.detents = [customDetent]
		self.sheetPresentationController?.prefersGrabberVisible = true
		
		//Title Label
		view.addSubview(titleLabel)
		
		NSLayoutConstraint.activate([
			//Title Label
			titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
			titleLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
		
		])
		
	}
	
}

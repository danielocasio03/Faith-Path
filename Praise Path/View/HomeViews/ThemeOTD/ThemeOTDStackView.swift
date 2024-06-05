//
//  ThemeOTDStackView.swift
//  Praise Path
//
//  Created by Daniel Efrain Ocasio on 3/17/24.
//

import Foundation
import UIKit

//StackView for the three ThemeOTD Items
class ThemeOTDStackView: UIStackView {
	
	
	//MARK: - Override Initializer
	override init(frame: CGRect) {
		super.init(frame: frame)
		
		setupStackView()
		
	}
	
	
	//MARK: - View Setup Functions
	
	func setupStackView() {
		
		self.translatesAutoresizingMaskIntoConstraints = false
		self.axis = .horizontal
		self.contentMode = .left
		self.distribution = .fillEqually
		
	}
	
	
	
	required init(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
}

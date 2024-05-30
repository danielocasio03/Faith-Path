//
//  CustomPathView.swift
//  Praise Path
//
//  Created by Daniel Efrain Ocasio on 4/2/24.
//

import Foundation
import UIKit

class OctagonButton: UIButton {
		
	lazy var buttonLabel: UILabel = {
		
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		label.font = DesignManager.shared.appFontMedium?.withSize(12)
		label.textColor = DesignManager.shared.systemWhite
		return label
	}()
	
	//Button is initialized with an image and title for the button which will be shown under or above the label. And other general setup.
	init(with Image: UIImage?, name: String) {
		super.init(frame: .zero)
		
		self.translatesAutoresizingMaskIntoConstraints = false
		self.imageView?.contentMode = .scaleAspectFit
		self.backgroundColor = .clear
		setImage(Image, for: .normal)
		self.buttonLabel.text = name
		self.addSubview(buttonLabel)
		
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
}

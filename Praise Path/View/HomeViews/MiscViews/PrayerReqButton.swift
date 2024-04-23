//
//  PrayerReqButton.swift
//  Praise Path
//
//  Created by Daniel Efrain Ocasio on 4/18/24.
//

import Foundation
import UIKit

class PrayerReqButton: UIButton {
	
	let designManager = DesignManager()
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		
		//Custom attributed text for the buttons text
		let customText = NSAttributedString(string: "Reach out", attributes:[
			.foregroundColor: designManager.systemWhite,
			.font: designManager.appFontSemiBold?.withSize(12) ?? UIFont.systemFont(ofSize: 12)
		])
		
		//button setup
		self.translatesAutoresizingMaskIntoConstraints = false
		self.backgroundColor = designManager.charcoalBlack
		self.layer.cornerRadius = 10
		self.setAttributedTitle(customText, for: .normal)
		
	
	//setup of the small dove image that will be added to the buttons view
		let doveImage = UIImageView(image: UIImage(named: "dove"))
		doveImage.translatesAutoresizingMaskIntoConstraints = false
		doveImage.contentMode = .scaleAspectFill
		doveImage.backgroundColor = .clear
		self.addSubview(doveImage)
		
		NSLayoutConstraint.activate([
		
			doveImage.trailingAnchor.constraint(equalTo: self.titleLabel!.leadingAnchor, constant: 2),
			doveImage.centerYAnchor.constraint(equalTo: self.titleLabel!.topAnchor, constant: 1),
			doveImage.widthAnchor.constraint(equalToConstant: 9),
			doveImage.heightAnchor.constraint(equalToConstant: 9)
			
		])
		
		
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
}

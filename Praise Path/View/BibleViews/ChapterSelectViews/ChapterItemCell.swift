//
//  ChapterItemCell.swift
//  Praise Path
//
//  Created by Daniel Efrain Ocasio on 6/10/24.
//

import Foundation
import UIKit

class ChapterItemCell: UICollectionViewCell {
	
	//This is the label that will hold the chapter for the given cell
	let numberLabel: UILabel = {
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		label.textColor = DesignManager.shared.darkGrayTextColor
		label.font = DesignManager.shared.appFontSemiBold?.withSize(24)
		label.layer.masksToBounds = false
		
		return label
	}()
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		
		setupCell()
		
	}
	
	
	func setupCell() {
		
		//Cells appearance
		self.backgroundColor = DesignManager.shared.darkItemColor
		self.layer.cornerRadius = 7
		//Adding a shadow to the cell
		self.layer.shadowColor = UIColor.black.cgColor
		self.layer.shadowOpacity = 0.5
		self.layer.shadowOffset = CGSize(width: 0, height: 1 )
		self.layer.shadowRadius = 3
		//numberLabel
		self.addSubview(numberLabel)
		
		
		//Setting the numberLabel to be in the very center of the cell
		NSLayoutConstraint.activate([
			numberLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
			numberLabel.centerYAnchor.constraint(equalTo: centerYAnchor)
		])
		
		
	}
	
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
}

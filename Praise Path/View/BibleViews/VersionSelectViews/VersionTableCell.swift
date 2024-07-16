//
//  VersionTableCell.swift
//  Praise Path
//
//  Created by Daniel Efrain Ocasio on 5/30/24.
//

import Foundation
import UIKit

class VersionTableCell: UITableViewCell {
	
	//MARK: - Declarations
	
	//Creates a variable for a UIView which will act as the visible content view of the cell
	lazy var contentContainer: UIView = {
		
		let view = UIView()
		view.translatesAutoresizingMaskIntoConstraints = false
		view.backgroundColor = DesignManager.shared.darkItemColor
		view.layer.cornerRadius = 7
		// Add shadow to contentContainer
		view.layer.shadowColor = UIColor.black.cgColor
		view.layer.shadowOpacity = 0.5
		view.layer.shadowOffset = CGSize(width: 0, height: 1 )
		view.layer.shadowRadius = 3
		view.layer.masksToBounds = false
		
		return view
	}()
	
	
	//Create a variable for a UILabel which will display the first and last name for the beneficiary
	lazy var abbreviationLabel: UILabel = {
		
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		label.textColor = DesignManager.shared.darkGrayTextColor.withAlphaComponent(0.90)
		label.font = DesignManager.shared.appFontMedium?.withSize(18)
		
		return label
	}()
	
	
	//Create a variable for a UILabel which will display the designation for the beneficiary
	lazy var bibleNameLabel: UILabel = {
		
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		label.textColor = DesignManager.shared.darkGrayTextColor.withAlphaComponent(0.80)
		label.font = DesignManager.shared.appFontMedium?.withSize(16)
		
		return label
		
		
	}()

	lazy var checkmark: UIImageView = {
		
		let image = UIImageView()
		image.translatesAutoresizingMaskIntoConstraints = false
		image.image = UIImage(systemName: "checkmark.circle.fill")
		image.tintColor = DesignManager.shared.darkGrayTextColor
		image.isHidden = true
		
		return image
	}()
	
	
	//MARK: - Override Initializer
	
	override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
		super.init(style: UITableViewCell.CellStyle.default, reuseIdentifier: reuseIdentifier)
		
		setupCell()
		setupContentContainer()
		
	}
	
	
	//MARK: - Setup Functions
	
	//sets up the actual cell
	func setupCell() {
		
		self.backgroundColor = .clear
		self.selectionStyle = .none
		
	}
	
	
	//Sets up the content container and its views in the cell
	func setupContentContainer() {
		
		self.addSubview(contentContainer)
		contentContainer.addSubview(abbreviationLabel)
		contentContainer.addSubview(bibleNameLabel)
		contentContainer.addSubview(checkmark)
		
		NSLayoutConstraint.activate([
			
			//contentContainer Constraints
			contentContainer.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.85),
			contentContainer.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.70),
			contentContainer.centerXAnchor.constraint(equalTo: self.centerXAnchor),
			contentContainer.centerYAnchor.constraint(equalTo: self.centerYAnchor),
			//nameLabel Constraints
			abbreviationLabel.bottomAnchor.constraint(equalTo: contentContainer.centerYAnchor),
			abbreviationLabel.leadingAnchor.constraint(equalTo: contentContainer.leadingAnchor, constant: 17),
			//designationLabel Constraints
			bibleNameLabel.topAnchor.constraint(equalTo: contentContainer.centerYAnchor),
			bibleNameLabel.leadingAnchor.constraint(equalTo: contentContainer.leadingAnchor, constant: 17),
			//chevronIcon Constraints
			checkmark.centerYAnchor.constraint(equalTo: contentContainer.centerYAnchor),
			checkmark.trailingAnchor.constraint(equalTo: contentContainer.trailingAnchor, constant: -20),
			
			
		])
		
	}
	
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
}




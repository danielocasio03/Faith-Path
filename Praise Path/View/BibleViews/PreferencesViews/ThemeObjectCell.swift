//
//  ThemeCollectionViewCell.swift
//  Praise Path
//
//  Created by Daniel Efrain Ocasio on 8/5/24.
//

import UIKit

class ThemeObjectCell: UICollectionViewCell {
	
	// MARK: - Declarations
	
	private let previewImage: UIImageView = {
		let image = UIImageView()
		image.translatesAutoresizingMaskIntoConstraints = false
		image.contentMode = .scaleAspectFit
		return image
	}()
	
	private let themeTitle: UILabel = {
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		label.font = DesignManager.shared.appFontSemiBold?.withSize(16)
		label.textColor = DesignManager.shared.darkGrayTextColor
		label.lineBreakMode = .byWordWrapping
		return label
	}()
	
	// MARK: - Init
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		contentView.addSubview(previewImage)
		contentView.addSubview(themeTitle)
		
		setupConstraints()
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	// MARK: - Setup Functions
	
	private func setupConstraints() {
		NSLayoutConstraint.activate([
			previewImage.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
			previewImage.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
			previewImage.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.70),
			previewImage.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.70),
			
			themeTitle.bottomAnchor.constraint(equalTo: previewImage.topAnchor, constant: -10),
			themeTitle.centerXAnchor.constraint(equalTo: previewImage.centerXAnchor),
		])
	}
	
	func configure(with themeName: String) {
		previewImage.image = UIImage(named: themeName)
		themeTitle.text = themeName
	}
}

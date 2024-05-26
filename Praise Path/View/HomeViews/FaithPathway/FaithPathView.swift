//
//  FaithPathView.swift
//  Praise Path
//
//  Created by Daniel Efrain Ocasio on 4/1/24.
//

import Foundation
import UIKit


class FaithPathView: UIView {
	
	//MARK: - Declarations
	
	let designManager = DesignManager()
		
	//UIView for the divider at the top of the FaithPathView
	lazy var dividerLine: UIView = {
		
		let view = UIView()
		view.translatesAutoresizingMaskIntoConstraints = false
		view.layer.cornerRadius = 1.5
		view.clipsToBounds = true
		
		return view
	}()
	
	//UILabel for the section
	lazy var sectionTitle: UILabel = {
		
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		label.font = designManager.appFontSemiBold?.withSize(17)
		label.textColor = designManager.systemWhite
		label.text = "Your Faith Path"
		
		return label
	}()
	
	//This is the imageview for the greenery backdrop
	lazy var backdropImage: UIImageView = {
		
		let image = UIImageView()
		image.translatesAutoresizingMaskIntoConstraints = false
		image.image = UIImage(named: "FaithPathBackdrop")
		image.contentMode = .scaleToFill
		
		return image
	}()
	
	//This is the PathwayView which features the image for the pathway and its buttons
	lazy var pathwayView = PathwayView()
	
	
	//MARK: - Override Functions
	
	//Initializer
	override init(frame: CGRect) {
		super.init(frame: frame)
		
		setupView()
		
	}
	
	//Layout Subviews
	override func layoutSubviews() {
		super.layoutSubviews()
		gradientSetups()
	}
	
	
	//MARK: - Setup Functions
	
	
	//This adds in the views major design components and constraints
	func setupView() {
		self.clipsToBounds = true
		self.translatesAutoresizingMaskIntoConstraints = false
		self.addSubview(dividerLine)
		self.addSubview(backdropImage)
		self.addSubview(sectionTitle)
		addSubview(pathwayView)
		
		NSLayoutConstraint.activate([
			//dividerLine Constraints
			dividerLine.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 15),
			dividerLine.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -15),
			dividerLine.topAnchor.constraint(equalTo: self.topAnchor),
			dividerLine.heightAnchor.constraint(equalToConstant: 3),
			//backdropImage Constraints
			backdropImage.topAnchor.constraint(equalTo: dividerLine.topAnchor),
			backdropImage.bottomAnchor.constraint(equalTo: self.bottomAnchor),
			backdropImage.trailingAnchor.constraint(equalTo: self.trailingAnchor),
			backdropImage.leadingAnchor.constraint(equalTo: self.leadingAnchor),
			//sectionTitle Constraints
			sectionTitle.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 25),
			sectionTitle.topAnchor.constraint(equalTo: dividerLine.bottomAnchor, constant: 20),
			sectionTitle.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.5),
			//pathwayView Constraints
			pathwayView.topAnchor.constraint(equalTo: dividerLine.bottomAnchor, constant: 30),
			pathwayView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -30),
			pathwayView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -45),
			pathwayView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 45),
		])
	}
	
	
	//This function sets up the gradient for the divider line (called in layoutSubviews)
	func gradientSetups() {
		
		let gradient = designManager.dividerGradient
		gradient.frame = dividerLine.bounds
		dividerLine.layer.insertSublayer(gradient, at: 0)
		
	}
	
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	
}

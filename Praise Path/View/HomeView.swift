//
//  HomeView.swift
//  Praise Path
//
//  Created by Daniel Efrain Ocasio on 2/20/24.
//

import Foundation
import UIKit

class HomeView: UIView {
		
	//MARK: - Declarations
	
	let colorManager = ColorManager()
	
	let scrollView = CustomScrollView()
	
	let verseOTDView = VerseOTDView()
	
	lazy var greetingLabel: UILabel = {
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		label.text = "Good Morning"
		label.font = colorManager.appFont
		label.textColor = .white
		return label
	}()
	

	
	
	//MARK: - Override Functions
	
	//Override Init
	override init(frame: CGRect) {
		super.init(frame: frame)

		self.translatesAutoresizingMaskIntoConstraints = false
		integrateScrollview()
		setupMiscViews()
		setupVerseOTD()
		
	}
	
	//Override layoutSubviews
	override func layoutSubviews() {
		super.layoutSubviews()

		//Setup of the background gradient for the HomeView
		let backgroundGradient = colorManager.homeScreenGradient
		backgroundGradient.frame = self.bounds
		self.layer.insertSublayer(backgroundGradient, at: 0)
	}
	
	
	//MARK: -  View setup Functions
	
	//Adds the scrollview and configures its constraints
	func integrateScrollview() {
		
		self.addSubview(scrollView)
		
		NSLayoutConstraint.activate([
			
			scrollView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
			scrollView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
			scrollView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
			scrollView.trailingAnchor.constraint(equalTo: self.trailingAnchor),

		])
		
	}
	
	
	//Add and setup of the Misc Views
	func setupMiscViews() {
		
		scrollView.contentView.addSubview(greetingLabel)
		
		NSLayoutConstraint.activate([
			
			greetingLabel.leadingAnchor.constraint(equalTo: scrollView.contentView.leadingAnchor, constant: 10),
			greetingLabel.topAnchor.constraint(equalTo: scrollView.contentView.topAnchor, constant: 10),
		
		])
		
	}
	
	
	//Add and setup of the VerseOTD view
	func setupVerseOTD() {
		
		scrollView.contentView.addSubview(verseOTDView)
		
		NSLayoutConstraint.activate([
			
			verseOTDView.centerXAnchor.constraint(equalTo: scrollView.contentView.centerXAnchor),
			verseOTDView.leadingAnchor.constraint(equalTo: scrollView.contentView.leadingAnchor),
			verseOTDView.trailingAnchor.constraint(equalTo: scrollView.contentView.trailingAnchor),
			verseOTDView.topAnchor.constraint(equalTo: greetingLabel.bottomAnchor, constant: 50),
			verseOTDView.heightAnchor.constraint(equalTo: scrollView.contentView.heightAnchor, multiplier: 0.15),

		])
		
	}
	
	
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	
}

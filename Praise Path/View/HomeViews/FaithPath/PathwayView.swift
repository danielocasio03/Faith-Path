//
//  pathwayView.swift
//  Praise Path
//
//  Created by Daniel Efrain Ocasio on 4/8/24.
//

import Foundation
import UIKit

class PathwayView: UIView {
	
	//MARK: - Declarations
	
	//This is the imageview for the pathway design
	lazy var faithPathImage: UIImageView = {
		let image =  UIImageView()
		image.translatesAutoresizingMaskIntoConstraints = false
		image.image = UIImage(named: "Pathway")
		image.contentMode = .scaleAspectFit
		image.layer.shadowColor = UIColor.white.cgColor
		return image
	}()
	
	//Habit Button
	lazy var habitButton = OctagonButton(with: UIImage(named: "HabitButton"), name: "Habit Tracker")
	
	//Bible Button
	lazy var bibleButton = OctagonButton(with: UIImage(named: "BibleButton"), name: "Bible")

	//Journal Button
	lazy var journalButton = OctagonButton(with: UIImage(named: "JournalButton"), name: "Journal")

	//Pray Button
	lazy var prayButton = OctagonButton(with: UIImage(named: "PrayButton"), name: "Pray")
	
	//Explore Button
	lazy var exploreButton = OctagonButton(with: UIImage(named: "ExploreButton"), name: "Explore")
	
	//This is the imageview for the cross at the top of the pathway design
	lazy var crossImage: UIImageView = {
		let image = UIImageView()
		image.translatesAutoresizingMaskIntoConstraints = false
		image.image = UIImage(named: "christian-cross")
		image.contentMode = .scaleAspectFit
		return image
	}()
	
	//MARK: - Override init
	
	//Override Initializer
	override init(frame: CGRect) {
		super.init(frame: frame)
		
		self.translatesAutoresizingMaskIntoConstraints = false
		setupPathImage()
		
	}
	
	//Layout Subviews
	override func layoutSubviews() {
		super.layoutSubviews()
		setupButtons()
	}
	
	
	//MARK: - Setup functions
	
	//This adds in the pathway image and configures its positioning
	func setupPathImage() {
		
		self.addSubview(faithPathImage)
		self.addSubview(crossImage)
		
		NSLayoutConstraint.activate([
			//faithPathImage Constraints
			faithPathImage.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: -50),
			faithPathImage.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0),
			faithPathImage.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0),
			faithPathImage.heightAnchor.constraint(lessThanOrEqualTo: self.heightAnchor, multiplier: 0.90),
			//crossImage Constraints
			crossImage.centerXAnchor.constraint(equalTo: self.centerXAnchor),
			crossImage.topAnchor.constraint(equalTo: self.topAnchor, constant: 0),
			crossImage.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.19),
			crossImage.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.40),
			
		])
		
	}
	
	//This function sets up the buttons and positions them accordingly on the pathway
	func setupButtons() {
		
		self.addSubview(habitButton)
		self.addSubview(bibleButton)
		self.addSubview(journalButton)
		self.addSubview(prayButton)
		self.addSubview(exploreButton)
		
		//The offsets and if statements are used to dynamically change the constraints offsets in order to get positioning perfect across all screens
		let buttonHorizontalOffset: CGFloat
		let bottomButtonVerticalOffset: CGFloat
		let topButtonVerticalOffset: CGFloat
		
		if UIDevice.current.userInterfaceIdiom == .pad {
			buttonHorizontalOffset = UIScreen.main.bounds.width * 0.31
			topButtonVerticalOffset = UIScreen.main.bounds.height * 0.07
			bottomButtonVerticalOffset = UIScreen.main.bounds.height * 0.48
		} else {
			buttonHorizontalOffset = UIScreen.main.bounds.width * 0.35
			topButtonVerticalOffset = UIScreen.main.bounds.height * 0.09
			bottomButtonVerticalOffset = UIScreen.main.bounds.height * 0.42
		}
		
		NSLayoutConstraint.activate([
			//Habit Button Constraints
			habitButton.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: -buttonHorizontalOffset),
			habitButton.topAnchor.constraint(equalTo: crossImage.topAnchor, constant: topButtonVerticalOffset),
			habitButton.widthAnchor.constraint(lessThanOrEqualTo: self.widthAnchor, multiplier: 0.2645),
			habitButton.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.115),
			habitButton.buttonLabel.centerXAnchor.constraint(equalTo: habitButton.centerXAnchor),
			habitButton.buttonLabel.bottomAnchor.constraint(equalTo: habitButton.topAnchor),
			//Bible Button Constraints
			bibleButton.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: buttonHorizontalOffset - 5),
			bibleButton.topAnchor.constraint(equalTo: crossImage.topAnchor, constant: topButtonVerticalOffset),
			bibleButton.widthAnchor.constraint(lessThanOrEqualTo: self.widthAnchor, multiplier: 0.2645),
			bibleButton.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.115),
			bibleButton.buttonLabel.centerXAnchor.constraint(equalTo: bibleButton.centerXAnchor),
			bibleButton.buttonLabel.bottomAnchor.constraint(equalTo: bibleButton.topAnchor),
			//Journal Constraints
			journalButton.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: -buttonHorizontalOffset),
			journalButton.topAnchor.constraint(equalTo: crossImage.centerYAnchor, constant: bottomButtonVerticalOffset - 5),
			journalButton.widthAnchor.constraint(lessThanOrEqualTo: self.widthAnchor, multiplier: 0.2645),
			journalButton.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.115),
			journalButton.buttonLabel.centerXAnchor.constraint(equalTo: journalButton.centerXAnchor),
			journalButton.buttonLabel.topAnchor.constraint(equalTo: journalButton.bottomAnchor),
			//Pray Button Constraints
			prayButton.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: buttonHorizontalOffset),
			prayButton.topAnchor.constraint(equalTo: crossImage.centerYAnchor, constant: bottomButtonVerticalOffset - 5),
			prayButton.widthAnchor.constraint(lessThanOrEqualTo: self.widthAnchor, multiplier: 0.2645),
			prayButton.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.115),
			prayButton.buttonLabel.centerXAnchor.constraint(equalTo: prayButton.centerXAnchor),
			prayButton.buttonLabel.topAnchor.constraint(equalTo: prayButton.bottomAnchor),
			//Explore Button
			exploreButton.centerXAnchor.constraint(equalTo: self.centerXAnchor),
			exploreButton.topAnchor.constraint(equalTo: prayButton.bottomAnchor),
			exploreButton.widthAnchor.constraint(lessThanOrEqualTo: self.widthAnchor, multiplier: 0.2645),
			exploreButton.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.115),
			exploreButton.buttonLabel.centerXAnchor.constraint(equalTo: exploreButton.centerXAnchor),
			exploreButton.buttonLabel.topAnchor.constraint(equalTo: exploreButton.bottomAnchor),
		])
		
	}
	
	
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	
}

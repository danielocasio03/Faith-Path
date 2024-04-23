//
//  MiscViews.swift
//  Praise Path
//
//  Created by Daniel Efrain Ocasio on 4/16/24.
//

import Foundation
import UIKit

class MiscView: UIView {
	
	//MARK: - Declarations
	
	let designManager = DesignManager()
	
	//border for the container
	lazy var containerBorder: UIView = {
	
		let view = UIView()
		view.backgroundColor = .clear
		view.translatesAutoresizingMaskIntoConstraints = false
		view.layer.cornerRadius = 25
		view.layer.borderColor = designManager.borderColor.cgColor
		view.layer.borderWidth = 2
		
		return view
		
	}()
	
	//holds all the content
	lazy var containerView: UIView = {
		
		let view = UIView()
		view.translatesAutoresizingMaskIntoConstraints = false
		view.backgroundColor = .clear
		view.layer.cornerRadius = 20
		view.clipsToBounds = true
		
		return view
	}()
	
	//Main Label holding the text for the box
	lazy var mainLabel: UILabel = {
		
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		label.font = designManager.appFontSemiBold?.withSize(12)
		label.textColor = designManager.systemWhite
		label.numberOfLines = 2
		label.lineBreakMode = .byWordWrapping
		label.textAlignment = .center
		
		
		return label
		
	}()
	
	//Spotify Button
	lazy var spotifyButton: UIButton = {
		
		let button = UIButton()
		button.translatesAutoresizingMaskIntoConstraints = false
		button.imageView?.contentMode = .scaleAspectFill
		button.setImage(UIImage(named: "Spotify"), for: .normal)
		button.isHidden = true
		button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)

		return button
		
	}()
	
	//Apple Music button
	lazy var appleMusicButton: UIButton = {
		
		let button = UIButton()
		button.translatesAutoresizingMaskIntoConstraints = false
		button.imageView?.contentMode = .scaleAspectFill
		button.setImage(UIImage(named: "AppleMusic"), for: .normal)
		button.isHidden = true
		button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
		
		return button
		
	}()
	
	//Button to request prayer
	lazy var prayerButton: PrayerReqButton = {
		
		let button = PrayerReqButton()
		button.isHidden = true
		button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
		
		return button
		
	}()
	
	//View which acts as the border for the prayer button
	lazy var prayerButtonBorder: UIView = {
		
		let borderView = UIView()
		//Creates and sets up the border for the button
		borderView.translatesAutoresizingMaskIntoConstraints = false
		borderView.layer.borderColor = designManager.borderColor.cgColor
		borderView.layer.borderWidth = 1.5
		borderView.layer.cornerRadius = 15
		borderView.isHidden = true
		return borderView
		
	}()
	
	@objc func buttonTapped() {
		
		print("tapped button")
	}
	
	
	
	//MARK: - Override Init's

	override init(frame: CGRect) {
		super.init(frame: frame)
		
		translatesAutoresizingMaskIntoConstraints = false
		setupContainerView()

	}
	
	override func layoutSubviews() {
		super.layoutSubviews()
		//Sets up the gradient that is that serves as the background for the container view
		let backgroundGradient = designManager.miscViewGradient
		backgroundGradient.frame = self.bounds
		containerView.layer.insertSublayer(backgroundGradient, at: 0)
		
		
	}
	
	//MARK: - Setup functions
	
	//Setup of the container view
	func setupContainerView() {
		
		self.addSubview(containerBorder)
		self.addSubview(containerView)
		containerView.addSubview(mainLabel)
		containerView.addSubview(spotifyButton)
		containerView.addSubview(appleMusicButton)
		containerView.addSubview(prayerButtonBorder)
		containerView.addSubview(prayerButton)
		
		NSLayoutConstraint.activate([
			//Container View
			containerView.topAnchor.constraint(equalTo: self.topAnchor),
			containerView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
			containerView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
			containerView.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.80),
			//Container Border
			containerBorder.topAnchor.constraint(equalTo: containerView.topAnchor,constant: -4),
			containerBorder.bottomAnchor.constraint(equalTo: containerView.bottomAnchor,constant: 4),
			containerBorder.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: -4),
			containerBorder.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: 4),
			//Main Label
			mainLabel.centerYAnchor.constraint(equalTo: containerView.centerYAnchor),
			mainLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 10),
			mainLabel.trailingAnchor.constraint(equalTo: containerView.centerXAnchor),
			//Button One
			spotifyButton.centerYAnchor.constraint(equalTo: containerView.centerYAnchor),
			spotifyButton.leadingAnchor.constraint(equalTo: containerView.centerXAnchor, constant: 5),
			spotifyButton.topAnchor.constraint(equalTo: containerView.topAnchor),
			spotifyButton.bottomAnchor.constraint(equalTo: containerView.bottomAnchor),
			spotifyButton.widthAnchor.constraint(equalTo: containerView.widthAnchor, multiplier: 0.23),
			//Button Two
			appleMusicButton.centerYAnchor.constraint(equalTo: containerView.centerYAnchor),
			appleMusicButton.leadingAnchor.constraint(equalTo: spotifyButton.trailingAnchor, constant: 5),
			appleMusicButton.topAnchor.constraint(equalTo: containerView.topAnchor),
			appleMusicButton.bottomAnchor.constraint(equalTo: containerView.bottomAnchor),
			appleMusicButton.widthAnchor.constraint(equalTo: containerView.widthAnchor, multiplier: 0.23),
			//Prayer Button
			prayerButton.centerYAnchor.constraint(equalTo: containerView.centerYAnchor),
			prayerButton.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -15),
			prayerButton.widthAnchor.constraint(equalTo: containerView.widthAnchor, multiplier: 0.23),
			//adds the border and sets its constraints to suround the button container
			prayerButtonBorder.leadingAnchor.constraint(equalTo: prayerButton.leadingAnchor, constant: -4),
			prayerButtonBorder.trailingAnchor.constraint(equalTo: prayerButton.trailingAnchor, constant: 4),
			prayerButtonBorder.bottomAnchor.constraint(equalTo: prayerButton.bottomAnchor, constant: 4),
			prayerButtonBorder.topAnchor.constraint(equalTo: prayerButton.topAnchor, constant: -4),
			
		])
	}
	
	
	
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
}

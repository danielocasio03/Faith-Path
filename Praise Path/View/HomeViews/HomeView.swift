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
	
	let designManager = DesignManager()
	
	let scrollView = CustomScrollView()
	
	let themeOTDView = ThemeOTDView()
	
	let verseOTDView = VerseOTDView()
	
	let faithPathView = FaithPathView()
	
	let musicView: MiscView = {
		
		let view = MiscView()
		view.appleMusicButton.isHidden = false
		view.spotifyButton.isHidden = false
		
		return view
		
	}()
	
	
	let prayRequestView: MiscView = {
		
		let view = MiscView()
		view.prayerButton.isHidden = false
		view.prayerButtonBorder.isHidden = false
		return view
		
	}()
	
	lazy var greetingLabel: UILabel = {
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		label.text = designManager.greeting
		label.font = designManager.appFontSemiBold
		label.textColor = designManager.systemWhite
		return label
	}()
	

	
	
	//MARK: - Override Functions
	
	//Override Init
	override init(frame: CGRect) {
		super.init(frame: frame)

		self.translatesAutoresizingMaskIntoConstraints = false
		integrateVerticalScrollview()
		setupView()
		setupThemeOTD()
		setupVerseOTD()
		setupFaithPath()
		setupMiscViews()
		
	}
	
	//Override layoutSubviews
	override func layoutSubviews() {
		super.layoutSubviews()

		//Setup of the background gradient for the HomeView
		let backgroundGradient = designManager.homeScreenGradient
		backgroundGradient.frame = self.bounds
		self.layer.insertSublayer(backgroundGradient, at: 0)
	}
	
	
	//MARK: -  View setup Functions
	
	//Adds the scrollview and configures its constraints so that it scrolls Vertically
	func integrateVerticalScrollview() {
		
		self.addSubview(scrollView)
		
		NSLayoutConstraint.activate([
			
			scrollView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
			scrollView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
			scrollView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
			scrollView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
			
			scrollView.contentView.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 2),
			scrollView.contentView.widthAnchor.constraint(equalTo: self.widthAnchor),

		])
		
	}
	
	
	//Add and setup of the Misc Views
	func setupView() {
		
		scrollView.contentView.addSubview(greetingLabel)
		
		NSLayoutConstraint.activate([
			
			greetingLabel.leadingAnchor.constraint(equalTo: scrollView.contentView.leadingAnchor, constant: 10),
			greetingLabel.topAnchor.constraint(equalTo: scrollView.contentView.topAnchor, constant: 30),
		
		])
		
	}
	
	
	//Add and setup of the ThemeOTD view
	func setupThemeOTD() {
		
		scrollView.contentView.addSubview(themeOTDView)
		
		NSLayoutConstraint.activate([
			
			themeOTDView.centerXAnchor.constraint(equalTo: scrollView.contentView.centerXAnchor),
			themeOTDView.leadingAnchor.constraint(equalTo: scrollView.contentView.leadingAnchor),
			themeOTDView.trailingAnchor.constraint(equalTo: scrollView.contentView.trailingAnchor),
			themeOTDView.topAnchor.constraint(equalTo: greetingLabel.bottomAnchor, constant: 50),
			themeOTDView.heightAnchor.constraint(equalTo: scrollView.contentView.heightAnchor, multiplier: 0.10),
			
		])
		
	}
	
	
	//Add and setup of the VerseOTD view
	func setupVerseOTD() {
		
		scrollView.contentView.addSubview(verseOTDView)
		
		NSLayoutConstraint.activate([
			
			verseOTDView.centerXAnchor.constraint(equalTo: scrollView.contentView.centerXAnchor),
			verseOTDView.leadingAnchor.constraint(equalTo: scrollView.contentView.leadingAnchor),
			verseOTDView.trailingAnchor.constraint(equalTo: scrollView.contentView.trailingAnchor),
			verseOTDView.topAnchor.constraint(equalTo: themeOTDView.bottomAnchor, constant: 50),
			verseOTDView.heightAnchor.constraint(equalTo: scrollView.contentView.heightAnchor, multiplier: 0.15),
			
		])
		
	}
	
	//Add in and setup the FaithPaths positioning
	func setupFaithPath() {
		
		scrollView.contentView.addSubview(faithPathView)
		
		
		NSLayoutConstraint.activate([
		
			faithPathView.centerXAnchor.constraint(equalTo: scrollView.contentView.centerXAnchor),
			faithPathView.leadingAnchor.constraint(equalTo: scrollView.contentView.leadingAnchor),
			faithPathView.trailingAnchor.constraint(equalTo: scrollView.contentView.trailingAnchor),
			faithPathView.topAnchor.constraint(equalTo: verseOTDView.bottomAnchor, constant: 50),
			faithPathView.heightAnchor.constraint(equalTo: scrollView.contentView.heightAnchor, multiplier: 0.45)
		
		
		])
		
	}
	
	//Add in and setup the musicView's and prayRequestView's positioning
	func setupMiscViews() {
		
		//musicView
		scrollView.contentView.addSubview(musicView)
		musicView.mainLabel.text = "Get in the mood, listen to our worship playlist!"
		//prayRequest
		scrollView.contentView.addSubview(prayRequestView)
		prayRequestView.mainLabel.text = "Praying for a miracle? Submit a prayer request here."
		
		NSLayoutConstraint.activate([
			//musicView
			musicView.centerXAnchor.constraint(equalTo: scrollView.contentView.centerXAnchor),
			musicView.leadingAnchor.constraint(equalTo: scrollView.contentView.leadingAnchor),
			musicView.trailingAnchor.constraint(equalTo: scrollView.contentView.trailingAnchor),
			musicView.topAnchor.constraint(equalTo: faithPathView.bottomAnchor, constant: 20),
			musicView.heightAnchor.constraint(equalTo: scrollView.contentView.heightAnchor, multiplier: 0.06),
			//prayRequest
			prayRequestView.centerXAnchor.constraint(equalTo: scrollView.contentView.centerXAnchor),
			prayRequestView.leadingAnchor.constraint(equalTo: scrollView.contentView.leadingAnchor),
			prayRequestView.trailingAnchor.constraint(equalTo: scrollView.contentView.trailingAnchor),
			prayRequestView.topAnchor.constraint(equalTo: musicView.bottomAnchor),
			prayRequestView.heightAnchor.constraint(equalTo: scrollView.contentView.heightAnchor, multiplier: 0.06),
			
		])
		
	}
	
	
	
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	
}

//
//  bgNoiseButton.swift
//  Praise Path
//
//  Created by Daniel Efrain Ocasio on 8/19/24.
//

import Foundation
import UIKit

class BGNoiseButton: UIButton {
	
	
	//MARK: - Declarations
	
	//This is the declaration for the menu displayed when the user taps the button
	lazy var soundsMenu: UIMenu = {
		let brightNoise = UIAction(title: "Bright Noise", handler: {[weak self] _ in self?.soundSelected(soundName: "Bright Noise") })
		let darkNoise = UIAction(title: "Dark Noise", handler: { [weak self] _ in self?.soundSelected(soundName: "Dark Noise") })
		let morningLakeside = UIAction(title: "Morning Lakeside", handler: { [weak self] _ in self?.soundSelected(soundName: "Morning Lakeside") })
		let silentForest = UIAction(title: "Silent Forest", handler: { [weak self] _ in self?.soundSelected(soundName: "Silent Forest") })
		let thunderAndRain = UIAction(title: "Thunder & rain", handler: { [weak self] _ in self?.soundSelected(soundName: "Thunder & Rain") })
		let waterStream = UIAction(title: "Water Stream", handler: { [weak self] _ in self?.soundSelected(soundName: "Water Stream") })
		let off = UIAction(title: "Off", handler: {[weak self] _ in self?.stopSelected() })

		return UIMenu(title: "Background Sounds", children: [brightNoise, darkNoise, morningLakeside, silentForest, thunderAndRain, waterStream, off])
	}()
	
	
	//MARK: - Override Init
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		
		setupButton()
		
	}
	
	//MARK: - Setup Functions
	
	func setupButton() {
		
		//Button Customization
		var config = UIButton.Configuration.plain()
		self.translatesAutoresizingMaskIntoConstraints = false
		self.backgroundColor = DesignManager.shared.darkItemColor
		self.tintColor = DesignManager.shared.darkGrayTextColor
		
		config.image = UIImage(systemName: "waveform")
		
		self.configuration = config
		self.menu = soundsMenu
		self.showsMenuAsPrimaryAction = true

	}
	
	//MARK: - Action functions
	
	//Function called when a sound is selected from the menu. Calls the method in BackGroundAudioManager that plays a the selected sound
	func soundSelected(soundName: String) {
		BackgroundAudioManager.shared.playSound(named: soundName)
	}
	
	//Function called when off is selected from the menu. Calls the method in BackGroundAudioManager that stops all sounds
	func stopSelected() {
		BackgroundAudioManager.shared.stopSound()
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
}

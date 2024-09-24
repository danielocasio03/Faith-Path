//
//  BackgroundAudioManager.swift
//  Praise Path
//
//  Created by Daniel Efrain Ocasio on 9/18/24.
//

import Foundation
import AVFoundation

class BackgroundAudioManager {
	
	static let shared = BackgroundAudioManager() // Singleton for easy access

	private var audioPlayer: AVAudioPlayer?

	// Configure audio session for background playback
	init() {
		do {
			try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
			try AVAudioSession.sharedInstance().setActive(true)
		} catch {
			print("Failed to configure audio session: \(error.localizedDescription)")
		}
	}
	
	// Play a sound based on its name
	func playSound(named soundName: String) {
		if let path = Bundle.main.path(forResource: soundName, ofType: "mp3") {
			let url = URL(fileURLWithPath: path)
			
			do {
				audioPlayer = try AVAudioPlayer(contentsOf: url)
				audioPlayer?.numberOfLoops = -1 // Making it Infinite loop
				audioPlayer?.play()
			} catch {
				print("Error playing sound: \(error.localizedDescription)")
			}
		}
	}
	
	// Stop the sound
	func stopSound() {
		audioPlayer?.stop()
	}
	
}

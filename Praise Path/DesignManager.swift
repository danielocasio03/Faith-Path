//
//  ColorManager.swift
//  Praise Path
//
//  Created by Daniel Efrain Ocasio on 2/20/24.
//

import Foundation
import UIKit

class DesignManager {
	
	//MARK: - App Colors
	
	let systemWhite = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 0.87)
	
	let appFontSemiBold = UIFont(name: "CrimsonProRoman-SemiBold", size: 30)
	
	let appFontMedium = UIFont(name: "CrimsonProRoman-Medium", size: 30)
		
	let overlayColor = UIColor(red: 18/255, green: 20/255, blue: 25/255, alpha: 0.55)
	
	let borderColor = UIColor(red: 35/255, green: 42/255, blue: 50/255, alpha: 1.0)

	
	//This is the setup of the gradient used in the background for most of the app
	var homeScreenGradient: CAGradientLayer = {
		
		let lightGradientColor = UIColor(red: 35/255, green: 42/255, blue: 50/255, alpha: 1.0)
		let darkGradientColor = UIColor(red: 9/255, green: 12/255, blue: 16/255, alpha: 1.0)
		
		let gradient = CAGradientLayer()
		gradient.colors = [lightGradientColor.cgColor, darkGradientColor.cgColor]
		gradient.startPoint = CGPoint(x: 0, y: 0)
		gradient.endPoint = CGPoint(x: 0.5, y: 1.0)
		
		return gradient
	}()
	
	// Defines greeting property and its logic below which based off the time of day will say, Good Morning, Good Afternoon or Good Evening
	var greeting: String
	
	init() {
		
		//Here it gets  the UI's color and design scheme based off the time of day
		let now = Date()
		let calendar = Calendar.current
		let hour = calendar.component(.hour, from: now)
		
		if hour > 6 && hour < 12 {
			//Morning Color Scheme (6am - 11:59pm)
			greeting = "Good Morning"
		} else if hour >= 12 && hour < 18 {
			//Afternoon scheme (12pm - 5:59pm)
			greeting = "Good Afternoon"

		}else {
			//Evening Scheme (6pm - 6am)
			greeting = "Good Evening"
		}
	}
	
	
	
	//MARK: - Array storing references to christian image assets
	
	var christianImages = [
	UIImage(named: "photo1"),
	UIImage(named: "photo2"),
	UIImage(named: "photo3"),
	UIImage(named: "photo4"),
	UIImage(named: "photo5"),
	UIImage(named: "photo6"),
	UIImage(named: "photo7"),
	UIImage(named: "photo8"),
	UIImage(named: "photo9"),
	UIImage(named: "photo10"),
	UIImage(named: "photo11"),
	UIImage(named: "photo12"),
	UIImage(named: "photo13"),
	UIImage(named: "photo14"),
	UIImage(named: "photo15"),
	UIImage(named: "photo16"),
	UIImage(named: "photo17"),
	UIImage(named: "photo18"),
	UIImage(named: "photo19"),
	UIImage(named: "photo20"),
	UIImage(named: "photo21"),
	UIImage(named: "photo22"),
	UIImage(named: "photo23"),
	UIImage(named: "photo24"),
	UIImage(named: "photo25"),
	UIImage(named: "photo26"),
	UIImage(named: "photo27"),
	UIImage(named: "photo28"),
	UIImage(named: "photo29"),
	UIImage(named: "photo30"),
	UIImage(named: "photo31"),
	UIImage(named: "photo32"),
	UIImage(named: "photo33"),
	UIImage(named: "photo34"),
	UIImage(named: "photo35"),
	UIImage(named: "photo36"),
	UIImage(named: "photo37"),
	UIImage(named: "photo38"),
	UIImage(named: "photo39"),
	]
	
	
}

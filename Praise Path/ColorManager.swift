//
//  ColorManager.swift
//  Praise Path
//
//  Created by Daniel Efrain Ocasio on 2/20/24.
//

import Foundation
import UIKit

class ColorManager {
	
	let systemWhite = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1.0)
	
	let appFont = UIFont(name: "CrimsonProRoman-SemiBold", size: 30)
		
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
	
	
	var christianImages = [
	UIImage(named: "photo1")
		
	]
	
	
}

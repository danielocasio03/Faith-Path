//
//  ReaderView.swift
//  Praise Path
//
//  Created by Daniel Efrain Ocasio on 5/8/24.
//

import Foundation
import UIKit


class ScriptureView: UIView {
	
	//MARK: - Declarations
	
	//MARK: - Override func/init
	
	//Init Override
	override init(frame: CGRect) {
		super.init(frame: frame)
		
		setupView()
		
	}
	
	
	//Override layoutSubviews
	override func layoutSubviews() {
		super.layoutSubviews()
		
		//Setup of the background gradient for the ReaderView
		let lightGradientColor = UIColor(red: 35/255, green: 42/255, blue: 50/255, alpha: 1.0)
		let darkGradientColor = UIColor(red: 9/255, green: 12/255, blue: 16/255, alpha: 1.0)
		let gradient = CAGradientLayer()
		gradient.colors = [lightGradientColor.cgColor, darkGradientColor.cgColor]
		gradient.startPoint = CGPoint(x: 0, y: 0)
		gradient.endPoint = CGPoint(x: 0.5, y: 1.0)
		gradient.frame = self.bounds
		self.layer.insertSublayer(gradient, at: 0)
		
	}
	
	
	
	//MARK: - Setup Functions
	
	func setupView() {
		
		translatesAutoresizingMaskIntoConstraints = false
		
	}
	
	
	
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	
	
	
}

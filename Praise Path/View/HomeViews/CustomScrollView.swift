//
//  ScrollView.swift
//  Praise Path
//
//  Created by Daniel Efrain Ocasio on 3/6/24.
//

import Foundation
import UIKit

//This is the overarching scrollview that all of the content on the home page go into
class CustomScrollView: UIScrollView {
		
	//MARK: - Declarations
	
	//This is the content view that will go in the scrollview and be the container view all of views houses within the scrollview
	 var contentView: UIView = {
		let view = UIView()
		view.translatesAutoresizingMaskIntoConstraints = false
		view.backgroundColor = .clear
		return view
	}()
	
	
	//MARK: - Override Initializers
	
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		
		setupScrollView()
		
	}
	
	
	//MARK: - Setup Functions
	
	//Setup of the ScrollView
	func setupScrollView() {
		
		//scrollview properties
		self.translatesAutoresizingMaskIntoConstraints = false
		self.backgroundColor = .clear
		//Add in ContentView
		addSubview(contentView)
		
		NSLayoutConstraint.activate([
			
			//constraints for the contentview essentially setting it equal to the scrollview and multiplying the height by 2 to add the scroll effect
			contentView.topAnchor.constraint(equalTo: self.topAnchor),
			contentView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
			contentView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
			contentView.trailingAnchor.constraint(equalTo: self.trailingAnchor),

			
		])
		
	}
	

	
	
	//Required init
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	

}

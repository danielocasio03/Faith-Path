//
//  ViewController.swift
//  Praise Path
//
//  Created by Daniel Efrain Ocasio on 2/20/24.
//

import UIKit

class ViewController: UIViewController {
	
	let homeView = HomeView()
	

	override func viewDidLoad() {
		super.viewDidLoad()
		
		viewSetup()
		
	}
	
	func viewSetup() {
		
		view.addSubview(homeView)
		
		
		NSLayoutConstraint.activate([
			
			homeView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
			homeView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
			homeView.topAnchor.constraint(equalTo: view.topAnchor),
			homeView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
		
		])
		
	}


}


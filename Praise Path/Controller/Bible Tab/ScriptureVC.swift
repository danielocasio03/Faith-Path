//
//  ReaderVC.swift
//  Praise Path
//
//  Created by Daniel Efrain Ocasio on 5/8/24.
//

import Foundation
import UIKit

class ScriptureVC: UIViewController {
	
	//MARK: - Declarations
	
	let scriptureView = ScriptureView()
	
	//MARK: - Override
	
	//viewDidLoad
	override func viewDidLoad() {
		super.viewDidLoad()
		
		setupView()
		
	}
	
	//MARK: - Setup Functions
	
	func setupView() {
		
		view.addSubview(scriptureView)
		
		NSLayoutConstraint.activate([
		
			scriptureView.topAnchor.constraint(equalTo: view.topAnchor),
			scriptureView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
			scriptureView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
			scriptureView.trailingAnchor.constraint(equalTo: view.trailingAnchor),

		])
		
	}
	
}

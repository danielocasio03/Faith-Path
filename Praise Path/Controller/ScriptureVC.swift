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
	
	let readerView = ScriptureView()
	
	//MARK: - Override
	
	//viewDidLoad
	override func viewDidLoad() {
		super.viewDidLoad()
		
		setupView()
		
	}
	
	//MARK: - Setup Functions
	
	func setupView() {
		
		view.addSubview(readerView)
		
		NSLayoutConstraint.activate([
		
			readerView.topAnchor.constraint(equalTo: view.topAnchor),
			readerView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
			readerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
			readerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),

		])
		
	}
	
}

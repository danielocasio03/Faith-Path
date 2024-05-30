//
//  ThemeOTDView.swift
//  Praise Path
//
//  Created by Daniel Efrain Ocasio on 3/12/24.
//

import Foundation
import UIKit

class ThemeOTDView: UIView {
	
	//MARK: - Declaraations
		
	let scrollView = CustomScrollView()
	
	let stackView = ThemeOTDStackView()
	
	lazy var themeSectionLabel: UILabel = {
		
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		label.font = DesignManager.shared.appFontSemiBold?.withSize(17)
		label.textColor = DesignManager.shared.systemWhite
		
		return label
	}()
	
	
	//MARK: - Override init
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		
		setupView()
		integrateHorizontalScrollStack()
		
		//MARK: - Setup functions
		
		//General setup for the view
		func setupView() {
			
			self.addSubview(themeSectionLabel)
			translatesAutoresizingMaskIntoConstraints = false
			backgroundColor = .clear
			
			NSLayoutConstraint.activate([
			
				themeSectionLabel.topAnchor.constraint(equalTo: self.topAnchor),
				themeSectionLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 25),
			
			])
			
		}
		
		
		//This is the setup function for setting up and adding the horizintal scrollview and stackview for the ThemeOTDView
		func integrateHorizontalScrollStack() {
			
			addSubview(scrollView)
			scrollView.contentView.addSubview(stackView)
			scrollView.isPagingEnabled = true
			scrollView.showsHorizontalScrollIndicator = false
			scrollView.showsVerticalScrollIndicator = false
			
			NSLayoutConstraint.activate([
				//scrollView Constraints
				scrollView.topAnchor.constraint(equalTo: self.themeSectionLabel.bottomAnchor, constant: 8),
				scrollView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
				scrollView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
				scrollView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
				//scrollViews contentView constraints
				scrollView.contentView.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 3),
				scrollView.contentView.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.80),
				//stackView Constraints
				stackView.topAnchor.constraint(equalTo: scrollView.contentView.topAnchor),
				stackView.bottomAnchor.constraint(equalTo: scrollView.contentView.bottomAnchor),
				stackView.leadingAnchor.constraint(equalTo: scrollView.contentView.leadingAnchor),
				stackView.trailingAnchor.constraint(equalTo: scrollView.contentView.trailingAnchor),
				stackView.widthAnchor.constraint(equalTo: scrollView.contentView.widthAnchor),
				stackView.heightAnchor.constraint(equalTo: scrollView.contentView.heightAnchor),

			])
		}
		
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	
}

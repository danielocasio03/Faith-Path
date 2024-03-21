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
	
	let colorManager = ColorManager()
	
	let scrollView = CustomScrollView()
	
	let stackView = ThemeOTDStackView()
	
	lazy var themeSectionLabel: UILabel = {
		
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		label.font = colorManager.appFontSemiBold?.withSize(17)
		label.text = "Today's Theme - Stress"
		label.textColor = colorManager.systemWhite
		
		return label
	}()
	
	
	//MARK: - Override init
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		
		setupView()
		integrateHorizontalScrollStack()
		
		//MARK: - Setup functions
		
		func setupView() {
			
			self.addSubview(themeSectionLabel)
			translatesAutoresizingMaskIntoConstraints = false
			backgroundColor = .clear
			
			NSLayoutConstraint.activate([
			
				themeSectionLabel.topAnchor.constraint(equalTo: self.topAnchor),
				themeSectionLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 25),
			
			])
			
		}
		
		
		func integrateHorizontalScrollStack() {
			
			addSubview(scrollView)
			scrollView.contentView.addSubview(stackView)
			
			NSLayoutConstraint.activate([
			
				scrollView.topAnchor.constraint(equalTo: self.themeSectionLabel.bottomAnchor),
				scrollView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
				scrollView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
				scrollView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
				
				scrollView.contentView.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 3),
				scrollView.contentView.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.85),
				
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

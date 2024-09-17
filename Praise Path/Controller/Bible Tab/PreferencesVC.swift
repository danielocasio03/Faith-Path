//
//  FontAndSettingsVC.swift
//  Praise Path
//
//  Created by Daniel Efrain Ocasio on 7/11/24.
//

import Foundation
import UIKit

class PreferencesVC: UIViewController {
	
	//MARK: - Declarations
	
	var didChangePreference: (()-> Void)?
	
	var savedPreferences: ScripturePreferences
	
	//This variable stores the current font size
	var fontSize: Float = 0
	
	//This variable stores the current line height
	var lineHeight: Float = 0
	
	//The label for the title of this VC
	lazy var titleLabel: UILabel = {
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		label.textColor = DesignManager.shared.darkGrayTextColor
		label.font = DesignManager.shared.appFontSemiBold?.withSize(21)
		label.text = "Preferences"
		
		return label
	}()
	
	//This is the left font button for shrinking the font size when tapped
	lazy var shrinkFontButton: UIButton = {
		let button = UIButton()
		var config = UIButton.Configuration.plain()
		button.translatesAutoresizingMaskIntoConstraints = false
		let image = UIImage(systemName: "textformat.size.smaller")?.withConfiguration(UIImage.SymbolConfiguration(pointSize: 22, weight: .regular))
		button.setImage(image, for: .normal)
		button.backgroundColor = DesignManager.shared.darkItemColor
		config.baseForegroundColor = DesignManager.shared.darkGrayTextColor
		config.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)
		button.configuration = config
		button.addTarget(self, action: #selector(shrinkTapped), for: .touchUpInside)
		
		return button
	}()
	
	//This is the small line view that goes in the center of the shrink and increase font buttons
	lazy var fontDividerView: UIView = {
		let view = UIView()
		view.translatesAutoresizingMaskIntoConstraints = false
		view.backgroundColor = DesignManager.shared.darkGrayTextColor.withAlphaComponent(0.7)
		view.layer.cornerRadius = 1
		
		return view
	}()
	
	//This is the right font button for increasing the font size when tapped
	lazy var increaseFontButton: UIButton = {
		let button = UIButton()
		var config = UIButton.Configuration.plain()
		button.translatesAutoresizingMaskIntoConstraints = false
		let image = UIImage(systemName: "textformat.size.larger")?.withConfiguration(UIImage.SymbolConfiguration(pointSize: 22, weight: .regular))
		button.setImage(image, for: .normal)
		button.backgroundColor = DesignManager.shared.darkItemColor
		config.baseForegroundColor = DesignManager.shared.darkGrayTextColor
		config.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)
		button.configuration = config
		button.addTarget(self, action: #selector(increaseTapped), for: .touchUpInside)
		
		return button
	}()
	
	//Progress Bar that indicates the current size of the font to the user
	lazy var fontSizeBar: UIProgressView = {
		let progressBar = UIProgressView()
		progressBar.translatesAutoresizingMaskIntoConstraints = false
		progressBar.trackTintColor = DesignManager.shared.darkItemColor
		progressBar.progressTintColor = DesignManager.shared.darkGrayTextColor
		progressBar.progress = fontSize
		
		return progressBar
	}()
	
	//The button that when tapped allows users to change the font face
	lazy var fontFaceButton: FontFaceSelectButton = {
		let button = FontFaceSelectButton()
		//passsing in reference of self to the button (retain cycle handled within the buttons class)
		button.preferencesVC = self
		//Call the function in charge of creating and setting the title
		button.setupButtonTitle(fontSystemName: savedPreferences.fontName)
		return button
	}()
	
	//Carousel allowing user to scroll through and select a theme
	lazy var themeSelectCarousel: ThemeSelectorCarousel = {
		let controller = ThemeSelectorCarousel()
		
		return controller
	}()
	
	//Button for turning on and choosing from an array of background noises to play
	lazy var bgNoiseButton: BGNoiseButton = {
		let button = BGNoiseButton()
		
		return button
	}()
	
	//Button allowing users to change the line height for scripture
	lazy var lineHeightButton: UIButton = {
		let button = UIButton()
		//Button Customization
		button.translatesAutoresizingMaskIntoConstraints = false
		button.backgroundColor = DesignManager.shared.darkItemColor
		button.tintColor = DesignManager.shared.darkGrayTextColor
		button.setImage(UIImage(systemName: "line.3.horizontal"), for: .normal)
		button.addTarget(self, action: #selector(lineHeightTapped), for: .touchUpInside)
		
		return button
	}()
	
	//Progress Bar that indicates the current line height
	lazy var lineHeightBar: UIProgressView = {
		let progressBar = UIProgressView()
		progressBar.translatesAutoresizingMaskIntoConstraints = false
		progressBar.trackTintColor = DesignManager.shared.darkItemColor
		progressBar.progressTintColor = DesignManager.shared.darkGrayTextColor
		progressBar.progress = lineHeight
		
		return progressBar
	}()
	
	//Constant coordinating progress bar progress with its set respectivefont size
	let fontSizes: [Float: String] = [
		0.0: "2.0em",
		0.25: "2.75em",
		0.50: "3.25em",
		0.75: "4.0em",
		1.0: "4.75em"
	]
	
	let lineHeights: [Float : String] = [
		0.0: "1.5",
		0.25: "1.8",
		0.50: "2.1",
		0.75: "2.4",
		1.0: "2.7",
	]
	
	
	
	//MARK: - Init and Override
	
	//Initializer -  Initialized with the savedPreferences fetched from coredata, so properties on preferences can be updated
	init(savedPreferences: ScripturePreferences) {
		self.savedPreferences = savedPreferences
		self.fontSize = fontSizes.first(where: {$0.value == savedPreferences.fontSize})?.key ?? 0.50
		self.lineHeight = lineHeights.first(where: {$0.value == savedPreferences.lineHeight})?.key ?? 0.50
		print(savedPreferences.lineHeight)
		super.init(nibName: nil, bundle: nil)
	}
	
	//ViewDidLoad
	override func viewDidLoad() {
		super.viewDidLoad()
		
		setupView()
		setupSubviews()
		setupCarouselAndMisc()
		
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	
	//ViewDidLayoutSubviews
	override func viewDidLayoutSubviews() {
		super.viewDidLayoutSubviews()
		//Applying a custom mask layer when the view loads
		shrinkFontButton.layer.mask = createCustomMaskLayer(for: shrinkFontButton, corners: [.layerMinXMinYCorner, .layerMinXMaxYCorner])
		increaseFontButton.layer.mask = createCustomMaskLayer(for: increaseFontButton, corners: [.layerMaxXMinYCorner, .layerMaxXMaxYCorner])
		fontFaceButton.layer.mask = createCustomMaskLayer(for: fontFaceButton, corners: [.layerMinXMaxYCorner, .layerMaxXMaxYCorner, .layerMaxXMinYCorner, .layerMinXMinYCorner])
		bgNoiseButton.layer.mask = createCustomMaskLayer(for: bgNoiseButton, corners: [.layerMinXMaxYCorner, .layerMaxXMaxYCorner, .layerMaxXMinYCorner, .layerMinXMinYCorner])
		lineHeightButton.layer.mask = createCustomMaskLayer(for: lineHeightButton, corners: [.layerMinXMaxYCorner, .layerMaxXMaxYCorner, .layerMaxXMinYCorner, .layerMinXMinYCorner])

	}
	
	//MARK: - Setup Functions
	
	//Function for setting the view up
	func setupView() {
		
		//Sets the background color to the dark theme
		self.view.backgroundColor = DesignManager.shared.darkBackgroundColor
		
		// Define custom detent slightly higher than medium and lower than large
		let customDetent = UISheetPresentationController.Detent.custom { context in
			return context.maximumDetentValue * 0.70
		}
		//Use detents so the VC only comes up about halfway, also enabling the grabber to be shown
		self.sheetPresentationController?.detents = [customDetent]
		self.sheetPresentationController?.prefersGrabberVisible = true
	}
	
	//Function for setting up the views subviews
	func setupSubviews() {
		//Title Label
		view.addSubview(titleLabel)
		//Font Size Buttons
		view.addSubview(shrinkFontButton)
		view.addSubview(increaseFontButton)
		view.addSubview(fontDividerView)
		view.addSubview(fontSizeBar)
		//Font Face Button
		view.addSubview(fontFaceButton)
		
		NSLayoutConstraint.activate([
			//Title Label
			titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 30),
			titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
			//Shrink Font Button
			shrinkFontButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
			shrinkFontButton.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 30),
			shrinkFontButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.22),
			shrinkFontButton.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.10),
			//Increase Font Button
			increaseFontButton.leadingAnchor.constraint(equalTo: shrinkFontButton.trailingAnchor, constant: 0),
			increaseFontButton.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 30),
			increaseFontButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.22),
			increaseFontButton.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.10),
			//Font Divier View
			fontDividerView.heightAnchor.constraint(equalTo: shrinkFontButton.heightAnchor, multiplier: 0.4),
			fontDividerView.widthAnchor.constraint(equalToConstant: 1),
			fontDividerView.centerXAnchor.constraint(equalTo: shrinkFontButton.trailingAnchor),
			fontDividerView.centerYAnchor.constraint(equalTo: shrinkFontButton.centerYAnchor),
			//Font Size bar
			fontSizeBar.heightAnchor.constraint(equalToConstant: 2),
			fontSizeBar.leadingAnchor.constraint(equalTo: shrinkFontButton.leadingAnchor, constant: 10),
			fontSizeBar.trailingAnchor.constraint(equalTo: increaseFontButton.trailingAnchor, constant: -10),
			fontSizeBar.topAnchor.constraint(equalTo: shrinkFontButton.bottomAnchor, constant: 5),
			//Font Face Button
			fontFaceButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.44),
			fontFaceButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
			fontFaceButton.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 30),
			fontFaceButton.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.10),

		])
		
	}
	
	//This is the setup function for managing and adding in the themeSelectCarousel and the three buttons underneath it
	func setupCarouselAndMisc() {
		//ThemeSelectCarousel
		addChild(themeSelectCarousel)
		themeSelectCarousel.view.translatesAutoresizingMaskIntoConstraints = false
		view.addSubview(themeSelectCarousel.view)
		themeSelectCarousel.didMove(toParent: self)
		//bgNoiseButton
		view.addSubview(bgNoiseButton)
		//lineHeightButton
		view.addSubview(lineHeightButton)
		//lineHeightBar
		view.addSubview(lineHeightBar)
		
		NSLayoutConstraint.activate([
			//ThemeSelectCarousel
			themeSelectCarousel.view.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
			themeSelectCarousel.view.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
			themeSelectCarousel.view.topAnchor.constraint(equalTo: fontSizeBar.bottomAnchor, constant: 15),
			themeSelectCarousel.view.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.50),
			//bgNoiseButton
			bgNoiseButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -5),
			bgNoiseButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
			bgNoiseButton.trailingAnchor.constraint(equalTo: view.centerXAnchor, constant: -10),
			bgNoiseButton.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.10),
			//lineHeightButton
			lineHeightButton.leadingAnchor.constraint(equalTo: view.centerXAnchor, constant: 10),
			lineHeightButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
			lineHeightButton.bottomAnchor.constraint(equalTo: bgNoiseButton.bottomAnchor),
			lineHeightButton.heightAnchor.constraint(equalTo: bgNoiseButton.heightAnchor),
			//lineHeightBar
			lineHeightBar.leadingAnchor.constraint(equalTo: lineHeightButton.leadingAnchor, constant: 10),
			lineHeightBar.trailingAnchor.constraint(equalTo: lineHeightButton.trailingAnchor, constant: -10),
			lineHeightBar.topAnchor.constraint(equalTo: lineHeightButton.bottomAnchor, constant: 5),
			lineHeightBar.heightAnchor.constraint(equalToConstant: 2)
		])
	}
	
	//MARK: - Helper Functions
	
	//This helps create the custom rounded corners on buttons
	func createCustomMaskLayer(for button: UIButton, corners: CACornerMask) -> CAShapeLayer {
		let maskPath = UIBezierPath(roundedRect: button.bounds, byRoundingCorners: UIRectCorner(rawValue: corners.rawValue), cornerRadii: CGSize(width: 7, height: 7))
		let maskLayer = CAShapeLayer()
		maskLayer.frame = button.bounds
		maskLayer.path = maskPath.cgPath
		return maskLayer
	}
	
	//Function called when the respective changes user preference needs to be saved
	func updatePreferences(for setting: String, value: String) {
		let context = savedPreferences.managedObjectContext
				
		// Update the relevant setting based on the provided type
		switch setting {
		case "fontSize":
			savedPreferences.fontSize = value
		case "lineHeight":
			savedPreferences.lineHeight = value
		case "fontName":
			savedPreferences.fontName = value
		default:
			print("Unknown setting type")
			return
		}
		
		// Save the context
		do {
			try context?.save()
		} catch {
			print("Failed to save preferences: \(error)")
		}
		
		didChangePreference!()
		
	}
	
	//MARK: - Action Functions
	
	//This the function called when the shrinkFontButton is tapped
	@objc func shrinkTapped() {
		//Lowers the font size by an increment of 25% and sets the bars progress
		if fontSize > 0.0 {
			fontSize -= 0.25
			fontSize = round(fontSize * 100) / 100 //Rounding to prevent any float inaccuracies from building
			print(fontSize)
			fontSizeBar.setProgress(fontSize, animated: true)
			updatePreferences(for: "fontSize", value: (fontSizes[fontSize] ?? fontSizes[0])!)
		} else {
			return
		}
	}
	
	//This the function called when the increaseFontButton is tapped button is tapped
	@objc func increaseTapped() {
		//Raises the font size by an increment of 25% and sets the bars progress
		if fontSize < 1 {
			fontSize += 0.25
			fontSize = round(fontSize * 100) / 100 //Rounding to prevent any float inaccuracies from building
			print(fontSize)
			fontSizeBar.setProgress(fontSize, animated: true)
			updatePreferences(for: "fontSize", value: (fontSizes[fontSize] ?? fontSizes[0])!)
		} else {
			return
		}
	}
	
	//This the function called when the lineHeightButton is tapped.
	@objc func lineHeightTapped() {
		//Raises the line height by an increment of 25% and sets the bars progress. It resets to 0 once max 1.0 has been reached
		if lineHeight < 1 {
			lineHeight += 0.25
		} else {
			lineHeight = 0
		}
		lineHeight = round(lineHeight * 100) / 100 //Rounding to prevent any float inaccuracies from building
		lineHeightBar.setProgress(lineHeight, animated: true) //Setting bar progress
		updatePreferences(for: "lineHeight", value: (lineHeights[lineHeight] ?? lineHeights[0])!) // updating user preferences
		
	}
	
}

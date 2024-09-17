//
//  ScriptureLoaderView.swift
//  Praise Path
//
//  Created by Daniel Efrain Ocasio on 6/13/24.
//

import Foundation
import UIKit
import WebKit

class ScriptureLoaderView: UIView {
	
	let storedDataManager = StoredDataManager()
		
	//MARK: - Properties & Declarations
	
	//webView for displaying the scripture content
	private lazy var webView: WKWebView = {
		
		let view = WKWebView()
		view.backgroundColor = .clear
		view.scrollView.backgroundColor = .clear
		view.backgroundColor = .clear
		view.isOpaque = false
		view.scrollView.isOpaque = false
		view.scrollView.isScrollEnabled = true
		
		return view
		
	}()
	
	//MARK: - Initialization
	
	init() {
		super.init(frame: .zero)
		self.backgroundColor = .clear
		setupWebView()
		
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
}

//MARK: - Private Methods

extension ScriptureLoaderView {
	
	private func setupWebView() {
		webView.translatesAutoresizingMaskIntoConstraints = false
		self.addSubview(webView)
		
		NSLayoutConstraint.activate([
		
			webView.widthAnchor.constraint(equalTo: self.widthAnchor),
			webView.heightAnchor.constraint(equalTo: self.heightAnchor),
			webView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
			webView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
		
		])
	}
	
	private func addCSStyles(html: String) -> String {
		
		// Load the base CSS from the file
		guard let cssFilePath = Bundle.main.path(forResource: "ScriptureCSS", ofType: "css"),
			  let cssContent = try? String(contentsOfFile: cssFilePath) else {
			return html // Return the original HTML if the CSS file is not found
		}
		
		// Fetch user preferences from Core Data
		guard let scripturePreferences = storedDataManager.fetchScripturePreferences().first else {
			// Embed the CSS into the HTML
			let styledHTML = """
	<html>
	<head>
	<style>\(cssContent)</style>
	</head>
	<body class="scripture-styles">\(html)</body>
	</html>
	"""
			return styledHTML
		}
		
		// Generate dynamic CSS based on user preferences
		let dynamicCSS = generateDynamicCSS(savedPreferences: scripturePreferences)
		
		// Combine the base CSS with the dynamic CSS
		let combinedCSS = cssContent + "\n" + dynamicCSS
		
		// Embed the CSS into the HTML
		let styledHTML = """
	<html>
	<head>
		<style>\(combinedCSS)</style>
	</head>
	<body class="scripture-styles">\(html)</body>
	</html>
	"""
		
		return styledHTML
	}
	
	//Function that created a CSS String to override the base CSS file properties with user preferences
	private func generateDynamicCSS(savedPreferences: ScripturePreferences) -> String {
		
		print(savedPreferences)
		// Get the user preferences or fall back to default values
		let fontSize = savedPreferences.fontSize
		let fontFace = savedPreferences.fontName
		let lineHeight = savedPreferences.lineHeight
		
		// Create the dynamic CSS string that only overrides the necessary properties
		return """
	body {
		font-family: \(fontFace);
		line-height: \(lineHeight);
	}
	
	p.p, p.q, p.m {
		font-size: \(fontSize);
	}
	
	p.p {
		line-height: \(lineHeight);
	}
	"""
		
	}
	
}

//MARK: - Public Methods

extension ScriptureLoaderView {
	
	func loadScripture(content: String) {
		
		let styledContent = addCSStyles(html: content)
		
		print(content)
		
		webView.loadHTMLString(styledContent, baseURL: nil)
		
	}
	
}

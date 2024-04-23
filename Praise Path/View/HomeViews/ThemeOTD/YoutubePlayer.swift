//
//  YoutubePlayer
//  Praise Path
//
//  Created by Daniel Efrain Ocasio on 3/23/24.
//

import Foundation
import WebKit

class YoutubePlayer: UIView {
	
//MARK: - Properties
	
	// WebView for displaying YouTube video
	private lazy var webView: WKWebView = {
		
		let webView = WKWebView()
		webView.backgroundColor = .clear
		webView.scrollView.backgroundColor = .clear
		webView.scrollView.isScrollEnabled = false
		return webView
	}()
	
//MARK: - Initialization
	
	required init?(coder: NSCoder) { nil }
	
	init() {
		super.init(frame: .zero)
		
		setupWebView()
	}
	
}

//MARK: - Private Methods

extension YoutubePlayer {
	
	// Set up the WebView constraints and styling
	private func setupWebView() {
		webView.translatesAutoresizingMaskIntoConstraints = false
		addSubview(webView)
		
		NSLayoutConstraint.activate([
		
			webView.widthAnchor.constraint(equalTo: widthAnchor),
			webView.heightAnchor.constraint(equalTo: heightAnchor),
			webView.centerXAnchor.constraint(equalTo: centerXAnchor),
			webView.centerYAnchor.constraint(equalTo: centerYAnchor)
			
		])
	}
	
}

//MARK: - Public Methods

extension YoutubePlayer {
	
	// Load a YouTube video with the given videoId
	func load(videoId: String) {
		let html = buildHtml(for: videoId)
		webView.loadHTMLString(html, baseURL: nil)
		
	}
	
	// Build the HTML string for embedding the YouTube video
	private func buildHtml(for videoId: String) -> String {
		"""
		<style>
			html, body, iframe {
				margin: 0 !important;
				padding: 0 !important;
				backgroundColor: transparent !important;
			}
		</style>
		<iframe width="88%" height="88%" src="https://www.youtube.com/embed/\(videoId)" title="YouTube player" frameborder="0" playsinline="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
		"""
	}
	
}

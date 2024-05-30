//
//  TabBarController.swift
//  Praise Path
//
//  Created by Daniel Efrain Ocasio on 4/19/24.
//

import Foundation
import UIKit

class TabBar: UITabBarController {
		
	override func viewDidLoad() {
		super.viewDidLoad()
		
		setupTabBar()
		
	}
	
	
	func setupTabBar() {
		view.translatesAutoresizingMaskIntoConstraints = false
		
		// Create a custom nav bar appearance
		let navBarAppearance = UINavigationBarAppearance()
		navBarAppearance.titleTextAttributes = [NSAttributedString.Key.font: DesignManager.shared.appFontMedium!.withSize(20)]
		navBarAppearance.largeTitleTextAttributes = [NSAttributedString.Key.font: DesignManager.shared.appFontSemiBold!, .foregroundColor: DesignManager.shared.systemWhite]
		navBarAppearance.backgroundEffect = UIBlurEffect(style: .dark)
		
		// Create a custom tab bar appearance
		let tabBarAppearance = UITabBarAppearance()
		tabBarAppearance.backgroundColor = DesignManager.shared.charcoalBlack.withAlphaComponent(0.2)
		// Set the default style to translucent
		tabBarAppearance.backgroundEffect = UIBlurEffect(style: .dark)
		
		
		// Apply the custom tabbar appearance
		tabBar.standardAppearance = tabBarAppearance
		tabBar.scrollEdgeAppearance = tabBarAppearance
		tabBar.tintColor = DesignManager.shared.systemWhite

		
		//Home Controller
		let homeVC = HomeVC()
		let homeNavController = UINavigationController(rootViewController: homeVC)
		homeNavController.tabBarItem = UITabBarItem(title: "Home", image: UIImage(systemName: "house"), tag: 0)
		homeNavController.navigationBar.isHidden = true
		
		//Bible Controller
		let bibleVC = BibleBooksVC()
		let bibleNavController = UINavigationController(rootViewController: bibleVC)
		bibleNavController.tabBarItem = UITabBarItem(title: "Bible", image: UIImage(systemName: "text.book.closed.fill"), tag: 1)
		// Apply the custom appearance to the navigation bar
		bibleVC.navigationController?.navigationBar.prefersLargeTitles = true
		bibleVC.title = "Bible"
		bibleVC.navigationController?.navigationBar.standardAppearance = navBarAppearance
		bibleVC.navigationController?.navigationBar.compactScrollEdgeAppearance = navBarAppearance
				
		
		self.setViewControllers([
			homeNavController,
			bibleNavController
		], animated: true)
	}
	
	
	
}



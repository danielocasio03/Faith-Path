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
		setupNavBar()
		
	}
	
	//Setup of all tabBars in the app
	func setupTabBar() {
		
		// Create a custom tab bar appearance
		let tabBarAppearance = UITabBarAppearance()
		tabBarAppearance.backgroundColor = DesignManager.shared.charcoalBlack.withAlphaComponent(0.2)
		// Set the default style to translucent
		tabBarAppearance.backgroundEffect = UIBlurEffect(style: .dark)
		// Apply the custom tabbar appearance
		tabBar.standardAppearance = tabBarAppearance
		tabBar.scrollEdgeAppearance = tabBarAppearance
		tabBar.tintColor = DesignManager.shared.systemWhite
		
	}
	
	//Setup Navigation and View Controllers
	func setupNavBar() {
		
		view.translatesAutoresizingMaskIntoConstraints = false

		//MARK: - Home Controller
		//Create the Home VC and Nav
		let homeVC = HomeVC()
		let homeNavController = UINavigationController(rootViewController: homeVC)
		homeNavController.tabBarItem = UITabBarItem(title: "Home", image: UIImage(systemName: "house"), tag: 0)
		homeNavController.navigationBar.isHidden = true
		
		//MARK: - Bible Navigation Controller
		//Create the bible VC and Nav
		let bibleVC = BibleBooksVC()
		let bibleNavController = UINavigationController(rootViewController: bibleVC)
		bibleNavController.tabBarItem = UITabBarItem(title: "Bible", image: UIImage(systemName: "text.book.closed.fill"), tag: 1)
		// Create a custom nav bar appearance
		let bibleNavAppearance = UINavigationBarAppearance()
		bibleNavAppearance.titleTextAttributes = [NSAttributedString.Key.font: DesignManager.shared.appFontMedium!.withSize(20)]
		bibleNavAppearance.largeTitleTextAttributes = [NSAttributedString.Key.font: DesignManager.shared.appFontSemiBold!, .foregroundColor: DesignManager.shared.systemWhite]
		bibleNavAppearance.backgroundEffect = UIBlurEffect(style: .dark)
		// Apply the custom appearance to the navigation bar
		bibleVC.navigationController?.navigationBar.standardAppearance = bibleNavAppearance
		bibleVC.navigationController?.navigationBar.compactScrollEdgeAppearance = bibleNavAppearance
		bibleVC.navigationController?.navigationBar.prefersLargeTitles = true
		bibleVC.title = "Bible"
				
		//Setting the view controllers
		self.setViewControllers([
			bibleNavController,
			homeNavController,
		], animated: true)
	}
	
}

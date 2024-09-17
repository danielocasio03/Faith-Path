//
//  VersionSelect.swift
//  Praise Path
//
//  Created by Daniel Efrain Ocasio on 5/29/24.
//

import Foundation
import UIKit

//This is the VC propped up when the user is attempting to change the bible version they are viewing
class VersionSelectVC: UIViewController {
	
	lazy var savedVersions: [BibleVersion] = []
	
	var passNewVersion: ((Int) -> Void)?
			
	//MARK: - Declarations
	
	//The label for the title of this VC
	lazy var controllerTitleLabel: UILabel = {
		
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		label.text = "Bible Version"
		label.textColor = DesignManager.shared.darkGrayTextColor.withAlphaComponent(1)
		label.font = DesignManager.shared.appFontSemiBold!.withSize(25)
		
		return label
	}()
	
	//Declares and returns a UITableView with preset properties
	private lazy var versionTable: UITableView = {
		let table = UITableView()
		table.register(VersionTableCell.self, forCellReuseIdentifier: "versionCell")
		table.dataSource = self
		table.delegate = self
		table.translatesAutoresizingMaskIntoConstraints = false
		table.backgroundColor = .clear
		table.separatorStyle = .none
		return table
	}()
	
	//MARK: - Override Func
	
	//viewDidLoad
	override func viewDidLoad() {
		super.viewDidLoad()
		
		setupView()
		setupTable()
		
	}
	
	//MARK: - Setup Functions
	
	//General View setup
	func setupView() {
		//Sets the background color to the dark theme
		self.view.backgroundColor = DesignManager.shared.darkBackgroundColor
		
		// Define custom detent slightly higher than medium and lower than large
		let customDetent = UISheetPresentationController.Detent.custom { context in
			return context.maximumDetentValue * 0.80
		}
		//Use detents so the screen only comes up about halfway, also enabling the grabber to be shown
		self.sheetPresentationController?.detents = [customDetent]
		self.sheetPresentationController?.prefersGrabberVisible = true
		
		//Adding and setup of subviews
		view.addSubview(controllerTitleLabel)
		
		NSLayoutConstraint.activate([
			
			controllerTitleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
			controllerTitleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
			
		])
		
	}
	
}


//MARK: - EXT: Table View
extension VersionSelectVC: UITableViewDelegate, UITableViewDataSource {
	
	//Sets up the Tableviews constraints and adds it to the view
	func setupTable() {
		view.addSubview(versionTable)
		NSLayoutConstraint.activate([
			versionTable.topAnchor.constraint(equalTo: controllerTitleLabel.bottomAnchor, constant: 45),
			versionTable.bottomAnchor.constraint(equalTo: view.bottomAnchor),
			versionTable.trailingAnchor.constraint(equalTo: view.trailingAnchor),
			versionTable.leadingAnchor.constraint(equalTo: view.leadingAnchor),
		])
		
	}
	
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		//Returns a cell for each bible version in the licensedBibleVersios Dictionary
		return savedVersions.count
		
	}
	
	
	//Returns the height for each cell in the tableView
	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		//Row height
		return tableView.frame.height * 0.17
		
	}
	
	//Cell For Row
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let versionCell = versionTable.dequeueReusableCell(withIdentifier: "versionCell", for: indexPath) as! VersionTableCell
		
		let versionForCell = savedVersions[indexPath.row]
		
		//Assigning abbreviation, bible name, and whether the checkmark is shown based off whether the version is currently selected
		versionCell.abbreviationLabel.text = versionForCell.abbreviation
		versionCell.bibleNameLabel.text = versionForCell.name
		versionCell.checkmark.isHidden = !versionForCell.isSelected

		return versionCell
		
	}
	
		//Did Select Row
		func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
			
			// Passes the newly selected version index back to the BibleBooksVC
			if let passNewVersion = passNewVersion {
				passNewVersion(indexPath.row)
			}
			
			// Reload the table view to reflect the changes
			tableView.reloadData()
			
			// Dismiss the view controller
			self.dismiss(animated: true)
		}
	}


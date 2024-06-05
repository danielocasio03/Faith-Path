//
//  ReaderView.swift
//  Praise Path
//
//  Created by Daniel Efrain Ocasio on 5/8/24.
//

import Foundation
import UIKit


class ScriptureView: UIView {
	
	//MARK: - Declarations
	
	//This is the Text View where the scripture's text will be shown
	lazy var scriptureField: UITextView = {
		let textView = UITextView()
		textView.translatesAutoresizingMaskIntoConstraints = false
		textView.isEditable = false
		textView.isScrollEnabled = true
		textView.font = DesignManager.shared.appFontMedium!.withSize(18)
		textView.textColor = DesignManager.shared.systemWhite
		textView.textAlignment = .justified
		textView.textContainer.lineBreakMode = .byWordWrapping
		textView.backgroundColor = .clear
		textView.text = """
1In the beginning God created the heavens and the earth. 2Now the earth was formless and empty, darkness was over the surface of the deep, and the Spirit of God was hovering over the waters.
3And God said, “Let there be light,” and there was light. 4God saw that the light was good, and he separated the light from the darkness. 5God called the light “day,” and the darkness he called “night.” And there was evening, and there was morning—the first day.
6And God said, “Let there be a vault between the waters to separate water from water.” 7So God made the vault and separated the water under the vault from the water above it. And it was so. 8God called the vault “sky.” And there was evening, and there was morning—the second day.
9And God said, “Let the water under the sky be gathered to one place, and let dry ground appear.” And it was so. 10God called the dry ground “land,” and the gathered waters he called “seas.” And God saw that it was good.
11Then God said, “Let the land produce vegetation: seed-bearing plants and trees on the land that bear fruit with seed in it, according to their various kinds.” And it was so. 12The land produced vegetation: plants bearing seed according to their kinds and trees bearing fruit with seed in it according to their kinds. And God saw that it was good. 13And there was evening, and there was morning—the third day.
14And God said, “Let there be lights in the vault of the sky to separate the day from the night, and let them serve as signs to mark sacred times, and days and years, 15and let them be lights in the vault of the sky to give light on the earth.” And it was so. 16God made two great lights—the greater light to govern the day and the lesser light to govern the night. He also made the stars. 17God set them in the vault of the sky to give light on the earth, 18to govern the day and the night, and to separate light from darkness. And God saw that it was good. 19And there was evening, and there was morning—the fourth day.
20And God said, “Let the water teem with living creatures, and let birds fly above the earth across the vault of the sky.” 21So God created the great creatures of the sea and every living thing with which the water teems and that moves about in it, according to their kinds, and every winged bird according to its kind. And God saw that it was good. 22God blessed them and said, “Be fruitful and increase in number and fill the water in the seas, and let the birds increase on the earth.” 23And there was evening, and there was morning—the fifth day.
24And God said, “Let the land produce living creatures according to their kinds: the livestock, the creatures that move along the ground, and the wild animals, each according to its kind.” And it was so. 25God made the wild animals according to their kinds, the livestock according to their kinds, and all the creatures that move along the ground according to their kinds. And God saw that it was good.
26Then God said, “Let us make mankind in our image, in our likeness, so that they may rule over the fish in the sea and the birds in the sky, over the livestock and all the wild animals, and over all the creatures that move along the ground.”
27So God created mankind in his own image,
in the image of God he created them;
male and female he created them.
28God blessed them and said to them, “Be fruitful and increase in number; fill the earth and subdue it. Rule over the fish in the sea and the birds in the sky and over every living creature that moves on the ground.”
29Then God said, “I give you every seed-bearing plant on the face of the whole earth and every tree that has fruit with seed in it. They will be yours for food. 30And to all the beasts of the earth and all the birds in the sky and all the creatures that move along the ground—everything that has the breath of life in it—I give every green plant for food.” And it was so.
31God saw all that he had made, and it was very good. And there was evening, and there was morning—the sixth day.
"""
		return textView
	}()
	
	//MARK: - Override func/init
	
	//Init Override
	override init(frame: CGRect) {
		super.init(frame: frame)
		
		setupView()
		
	}
	
	
	//Override layoutSubviews
	override func layoutSubviews() {
		super.layoutSubviews()
		
		//Setup of the background gradient for the ScriptureView
		let lightGradientColor = UIColor(red: 35/255, green: 42/255, blue: 50/255, alpha: 1.0)
		let darkGradientColor = UIColor(red: 9/255, green: 12/255, blue: 16/255, alpha: 1.0)
		let gradient = CAGradientLayer()
		gradient.colors = [lightGradientColor.cgColor, darkGradientColor.cgColor]
		gradient.startPoint = CGPoint(x: 0, y: 0)
		gradient.endPoint = CGPoint(x: 0.5, y: 1.0)
		gradient.frame = self.bounds
		self.layer.insertSublayer(gradient, at: 0)
		
	}
	
	
	
	//MARK: - Setup Functions
	
	func setupView() {
		translatesAutoresizingMaskIntoConstraints = false
		
		self.addSubview(scriptureField)
		
		NSLayoutConstraint.activate([
			
			scriptureField.leadingAnchor.constraint(equalTo: self.leadingAnchor),
			scriptureField.trailingAnchor.constraint(equalTo: self.trailingAnchor),
			scriptureField.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
			scriptureField.bottomAnchor.constraint(equalTo: self.bottomAnchor),

		])
		
	}
	
	
	
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	
	
	
}

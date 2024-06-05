//
//  DesignManager.swift
//  Praise Path
//
//  Created by Daniel Efrain Ocasio on 2/20/24.
//

import Foundation
import UIKit
import CommonCrypto
import CoreData

public class DesignManager {
	
	// Singleton instance
	public static let shared = DesignManager()
	
	//reference to managed objecdt context
	let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
	
	// Private initializer to prevent the creation of multiple instances
	private init() {
		let now = Date()
		let calendar = Calendar.current
		let hour = calendar.component(.hour, from: now)
		
		if hour > 6 && hour < 12 {
			// Morning Scheme (6am - 11:59am)
			greeting = "Good Morning"
		} else if hour >= 12 && hour < 18 {
			// Afternoon Scheme (12pm - 5:59pm)
			greeting = "Good Afternoon"
		} else {
			// Evening Scheme (6pm - 6am)
			greeting = "Good Evening"
		}
	}
	
	//MARK: - App Colors & Font
	
	//Font used across the app in Bold
	public let appFontBold = UIFont(name: "CrimsonProRoman-Bold", size: 30)
	
	//Font used across the app in Semi-Bold
	public let appFontSemiBold = UIFont(name: "CrimsonProRoman-SemiBold", size: 30)
	
	//Font used across the app in Medium
	public let appFontMedium = UIFont(name: "CrimsonProRoman-Medium", size: 30)
	
	//Character Font used across the app in White
	public let systemWhite = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 0.87)
	
	// Overlay for the Verse OTDView
	public let overlayColor = UIColor(red: 18/255, green: 20/255, blue: 25/255, alpha: 0.55)
	
	// Border color used in the VerseOTDView
	public let grayBlack = UIColor(red: 35/255, green: 42/255, blue: 50/255, alpha: 1.0)
	
	// Color used for the prayer request button`
	public let charcoalBlack = UIColor(red: 12/255, green: 14/255, blue: 20/255, alpha: 1.0)
	
	//Bible Tab Colors
	public let darkBackgroundColor = UIColor(red: 22/255, green: 24/255, blue: 27/255, alpha: 1.0)
	
	public let darkItemColor = UIColor(red: 17/255, green: 20/255, blue: 23/255, alpha: 1.0)
	
	public let darkGrayTextColor = UIColor(red: 111/255, green: 115/255, blue: 118/255, alpha: 1)
	
	// Gradient for the divider line used in the FaithPathView
	public var dividerGradient: CAGradientLayer = {
		let darkOpaqueColor = UIColor(red: 49/255, green: 56/255, blue: 64/255, alpha: 0.75)
		let gradient = CAGradientLayer()
		gradient.colors = [darkOpaqueColor.cgColor, UIColor.clear.cgColor]
		gradient.startPoint = CGPoint(x: 0, y: 0)
		gradient.endPoint = CGPoint(x: 1.0, y: 0)
		return gradient
	}()
	
	// Defines greeting property and its logic below which based off the time of day will say, Good Morning, Good Afternoon or Good Evening
	public var greeting: String
	
	//MARK: - Bible Contents
	
	// Based off UICollectionView index this dictionary provides the Name for the book
	public var tableOfContentsDict: [[Int:Int]:String] = [
		// Section 1 of CollectionView
		[0:0]:"Genesis",
		[0:1]:"Exodus",
		[0:2]:"Leviticus",
		// Section 2 of CollectionView
		[1:0]:"Numbers",
		[1:1]:"Deuteronomy",
		[1:2]:"Joshua",
		// Section 3 of CollectionView
		[2:0]:"Judges",
		[2:1]:"Ruth",
		[2:2]:"I Samuel",
		// Section 4 of CollectionView
		[3:0]:"II Samuel",
		[3:1]:"I Kings",
		[3:2]:"II Kings",
		// Section 5 of CollectionView
		[4:0]:"I Chronicles",
		[4:1]:"II Chronicles",
		[4:2]:"Ezra",
		// Section 6 of CollectionView
		[5:0]:"Nehemiah",
		[5:1]:"Esther",
		[5:2]:"Job",
		// Section 7 of CollectionView
		[6:0]:"Psalms",
		[6:1]:"Proverbs",
		[6:2]:"Ecclesiastes",
		// Section 8 of CollectionView
		[7:0]:"Song of Solomon",
		[7:1]:"Isaiah",
		[7:2]:"Jeremiah",
		// Section 9 of CollectionView
		[8:0]:"Lamentations",
		[8:1]:"Ezekiel",
		[8:2]:"Daniel",
		// Section 10 of CollectionView
		[9:0]:"Hosea",
		[9:1]:"Joel",
		[9:2]:"Amos",
		// Section 11 of CollectionView
		[10:0]:"Obadiah",
		[10:1]:"Jonah",
		[10:2]:"Micah",
		// Section 12 of CollectionView
		[11:0]:"Nahum",
		[11:1]:"Habakkuk",
		[11:2]:"Zephaniah",
		// Section 13 of CollectionView
		[12:0]:"Haggai",
		[12:1]:"Zechariah",
		[12:2]:"Malachi",
		// Section 14 of CollectionView
		[13:0]:"Matthew",
		[13:1]:"Mark",
		[13:2]:"Luke",
		// Section 15 of CollectionView
		[14:0]:"John",
		[14:1]:"Acts",
		[14:2]:"Romans",
		// Section 16 of CollectionView
		[15:0]:"1 Corinthians",
		[15:1]:"2 Corinthians",
		[15:2]:"Galatians",
		// Section 17 of CollectionView
		[16:0]:"Ephesians",
		[16:1]:"Philippians",
		[16:2]:"Colossians",
		// Section 18 of CollectionView
		[17:0]:"1 Thessalonians",
		[17:1]:"2 Thessalonians",
		[17:2]:"1 Timothy",
		// Section 19 of CollectionView
		[18:0]:"2 Timothy",
		[18:1]:"Titus",
		[18:2]:"Philemon",
		// Section 20 of CollectionView
		[19:0]:"Hebrews",
		[19:1]:"James",
		[19:2]:"1 Peter",
		// Section 21 of CollectionView
		[20:0]:"2 Peter",
		[20:1]:"1 John",
		[20:2]:"2 John",
		// Section 22 of CollectionView
		[21:0]:"3 John",
		[21:1]:"Jude",
		[21:2]:"Revelation",
		
	]
	
	
	// MARK: - ThemeOTD Methods
	
	//These are all of the possible themes that can be queried for the theme of the day
	public var queryThemes: [String] = [
		// A - C : 47
		"Abundance", "Acceptance", "Accountability", "Addiction", "Advent 2021", "Adversity", "Alcohol", "Anger", "Anxiety", "Attitude", "Authority", "Backsliding", "Balance", "Baptism", "Beauty",
		"Being a Servant", "Being Born Again", "Being Faithful", "Being Humble", "Being like Christ","Being Positive", "Being Thankful", "Believing God", "Betrayal", "Bitterness",
		"Blessings", "Boldness", "Bondage", "Bullying", "Calling","Change", "Character", "Cheating", "Children", "Clarity","Commitment", "Communion", "Community", "Compassion", "Compromise",
		"Confidence", "Confusion", "Contentment", "Control", "Conviction", "Counseling", "Courage",
		//D - F : 45
		"Darkness", "Dating", "Death", "Debt", "Deception", "Deliverance", "Demons", "Destiny", "Determination", "Diligence", "Direction", "Discipline", "Disclipleship", "Discouragement", "Disobedience",
		"Distractions", "Division", "Doubt", "Drinking", "Drunkenness", "Education", "Emotions", "Encouraging Others", "Envy", "Evangelism", "Excellence", "Expectation", "Failure", "Faith", "Family Love",
		"Family Unity", "Fasting", "Fathers", "Favor", "Fellowship", "Fighting", "Finances", "Flesh", "Focus", "Forgiveness", "Forgiveness of Sin", "Forgiving Yourself", "Foundation", "Freedom", "Friendship",
		//G  - I : 54
		"Generational Curses", "Gentleness", "Giving Offering", "Giving to the Poor", "Giving Up", "Gluttony", "God's Faithfulness", "God's Forgiveness", "God's Love", "God's Mercy",
		"God's Protection", "God's Provision", "Goodness", "Grace", "Gratitude", "Greed", "Happiness", "Hate", "Healing", "Healing a Broken Heart", "Health", "Helping Others", "Holiness", "Honesty", "Hopelessness",
		"Hospitality", "Humility", "Hunger", "Hypocrisy", "Identity", "Insecurity", "Integrity", "Joy", "Justice", "Kindness", "Leadership", "Light", "Listening", "Loneliness", "Love",
		"Loyalty", "Lust", "Lying", "Marriage", "Maturity", "Mercy", "Ministry", "Miracles", "Money", "Mothers", "New Beginnings", "Obedience", "Offense", "Overcoming Fear",
		// P - Z : 60
		"Parenting", "Patience", "Peace", "Persecution", "Perseverance", "Planning", "Pleasing God", "Praise", "Preparation", "Pride", "Procrastination", "Prosperity", "Protection", "Purity", "Purpose",
		"Putting God First", "Reconciliation", "Redemption", "Rejection", "Renewal", "Repentance", "Respect", "Responsibility", "Rest", "Restoration", "Resurrection", "Righteousness", "Salvation", "Sanctification", "Self Control",
		"Selfishness", "Serving God", "Shame", "Sin", "Sleep", "Speaking in Tongues", "Stewardship", "Stress", "Strongholds", "Surrender", "Temptation", "Thankfulness", "Thanksgiving", "The Flesh", "The Name of Jesus",
		"The Tongue", "Thoughts", "Tithing", "Transformation", "Trust", "Trusting God", "Truth", "Unity", "Victory", "Vision", "Wealth", "Wisdom", "Witnessing", "Worry", "Worship"
	]
	
	// Property to get the current theme
	public var currentTheme: String {
		return getCurrentTheme()
	}
	
	//Function which returns a theme from the query theme dictionary; retriving a new one for each day
	private func getCurrentTheme() -> String {
		let calendar = Calendar.current
		let now = Date()
		let components = calendar.dateComponents([.year, .month, .day], from: now)
		
		guard let year = components.year, let month = components.month, let day = components.day else {
			return queryThemes.randomElement() ?? "Default Theme"
		}
		
		let dateString = String(format: "%04d-%02d-%02d", year, month, day)
		let hashValue = hashString(dateString)
		let randomIndex = abs(hashValue) % queryThemes.count
		
		return queryThemes[randomIndex]
	}
	
	private func hashString(_ string: String) -> Int {
		var hash = 0
		for char in string {
			hash = Int(char.unicodeScalars.first!.value) &+ (hash << 5) &- hash
		}
		return hash
	}
	
	//MARK: - Array storing references to christian image assets
	//Stores images for the Verse Of The Day
	public var christianImages = [
		UIImage(named: "photo1"),
		UIImage(named: "photo2"),
		UIImage(named: "photo3"),
		UIImage(named: "photo4"),
		UIImage(named: "photo5"),
		UIImage(named: "photo6"),
		UIImage(named: "photo7"),
		UIImage(named: "photo8"),
		UIImage(named: "photo9"),
		UIImage(named: "photo10"),
		UIImage(named: "photo11"),
		UIImage(named: "photo12"),
		UIImage(named: "photo13"),
		UIImage(named: "photo14"),
		UIImage(named: "photo15"),
		UIImage(named: "photo16"),
		UIImage(named: "photo17"),
		UIImage(named: "photo18"),
		UIImage(named: "photo19"),
		UIImage(named: "photo20"),
		UIImage(named: "photo21"),
		UIImage(named: "photo22"),
		UIImage(named: "photo23"),
		UIImage(named: "photo24"),
		UIImage(named: "photo25"),
		UIImage(named: "photo26"),
		UIImage(named: "photo27"),
		UIImage(named: "photo28"),
		UIImage(named: "photo29"),
		UIImage(named: "photo30"),
		UIImage(named: "photo31"),
		UIImage(named: "photo32"),
		UIImage(named: "photo33"),
		UIImage(named: "photo34"),
		UIImage(named: "photo35"),
		UIImage(named: "photo36"),
		UIImage(named: "photo37"),
		UIImage(named: "photo38"),
		UIImage(named: "photo39"),
	]
	
	
}

//
//  ThemeSelectorCarousel2.swift
//  Praise Path
//
//  Created by Daniel Efrain Ocasio on 8/13/24.
//

import UIKit

class ThemeSelectorCarousel: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
	
	// MARK: - Declarations
	
	private let collectionView: UICollectionView = {
		let layout = PeekCarouselFlowLayout()
		
		let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
		collectionView.showsHorizontalScrollIndicator = false
		collectionView.translatesAutoresizingMaskIntoConstraints = false
		
		return collectionView
	}()
	
	private let pageControl = UIPageControl()
	private let themeNames = ["Light", "Classic", "Dark"]
	
	// MARK: - Lifecycle
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		setupView()
		setupCollectionView()
		setupPageControl()
	}
	
	// MARK: - Setup Functions
	
	private func setupView() {
		view.backgroundColor = .clear
		view.layer.cornerRadius = 10
	}
	
	private func setupCollectionView() {
		view.addSubview(collectionView)
		collectionView.backgroundColor = DesignManager.shared.darkItemColor
		collectionView.layer.cornerRadius = 10
		
		collectionView.delegate = self
		collectionView.dataSource = self
		collectionView.register(ThemeCollectionViewCell.self, forCellWithReuseIdentifier: "ThemeCell")
		
		NSLayoutConstraint.activate([
			collectionView.topAnchor.constraint(equalTo: view.topAnchor),
			collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
			collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
			collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
		])
	}
	
	private func setupPageControl() {
		pageControl.translatesAutoresizingMaskIntoConstraints = false
		pageControl.numberOfPages = themeNames.count
		pageControl.currentPage = 0
		pageControl.pageIndicatorTintColor = DesignManager.shared.darkGrayTextColor.withAlphaComponent(0.5)
		pageControl.currentPageIndicatorTintColor = DesignManager.shared.darkGrayTextColor
		
		view.addSubview(pageControl)
		
		NSLayoutConstraint.activate([
			pageControl.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -5),
			pageControl.centerXAnchor.constraint(equalTo: view.centerXAnchor),
			pageControl.heightAnchor.constraint(equalToConstant: 20)
		])
	}
	
	// MARK: - UICollectionViewDataSource
	
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return themeNames.count
	}
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ThemeCell", for: indexPath) as! ThemeCollectionViewCell
		let themeName = themeNames[indexPath.item]
		cell.configure(with: themeName)
		return cell
	}
	
	// MARK: - UICollectionViewDelegateFlowLayout
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
		guard let layout = collectionViewLayout as? PeekCarouselFlowLayout else {
			return CGSize(width: collectionView.frame.width * 0.75, height: collectionView.frame.height)
		}
		return layout.itemSize
	}
	
	func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
		let pageWidth = scrollView.frame.width - 2 * (scrollView.frame.width * 0.25)
		let pageIndex = round(scrollView.contentOffset.x / pageWidth)
		
		pageControl.currentPage = Int(pageIndex)
	}
}



class PeekCarouselFlowLayout: UICollectionViewFlowLayout {
	
	let peekPercentage: CGFloat = 0.25
	
	override func prepare() {
		super.prepare()
		
		guard let collectionView = collectionView else { return }
		
		// Set the scroll direction to horizontal
		scrollDirection = .horizontal
		
		// Calculate available width and peek width
		let availableWidth = collectionView.bounds.width
		let peekWidth = availableWidth * peekPercentage
		
		// Set the item size, considering peeking
		itemSize = CGSize(width: availableWidth - 2 * peekWidth, height: collectionView.bounds.height)
		
		// Set section insets to allow peeking
		sectionInset = UIEdgeInsets(top: 0, left: peekWidth, bottom: 0, right: peekWidth)
		
		// Disable line spacing
		minimumLineSpacing = 0
		
		// Disable paging as we're handling the centering
		collectionView.isPagingEnabled = false
	}
	
	override func shouldInvalidateLayout(forBoundsChange newBounds: CGRect) -> Bool {
		return true
	}
	
	override func targetContentOffset(forProposedContentOffset proposedContentOffset: CGPoint, withScrollingVelocity velocity: CGPoint) -> CGPoint {
		guard let collectionView = collectionView else { return super.targetContentOffset(forProposedContentOffset: proposedContentOffset, withScrollingVelocity: velocity) }
		
		let pageWidth = itemSize.width
		let collectionViewWidth = collectionView.bounds.width
		
		// Calculate the proposed content offset with insets
		let proposedContentOffsetCenterX = proposedContentOffset.x + collectionViewWidth / 2.0
		
		// Calculate the index of the item that should be centered
		let indexPath = collectionView.indexPathForItem(at: CGPoint(x: proposedContentOffsetCenterX, y: collectionView.bounds.height / 2.0)) ?? IndexPath(item: 0, section: 0)
		let cellRect = collectionView.layoutAttributesForItem(at: indexPath)?.frame ?? CGRect.zero
		
		// Center the cell in the collection view
		let targetOffsetX = cellRect.origin.x - (collectionViewWidth - pageWidth) / 2.0
		
		return CGPoint(x: targetOffsetX, y: proposedContentOffset.y)
	}
}
	


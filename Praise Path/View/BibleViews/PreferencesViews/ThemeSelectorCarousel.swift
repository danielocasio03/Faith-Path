import UIKit

// MARK: - ThemeSelectorCarousel

class ThemeSelectorCarousel: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
	
	// MARK: - Properties
	
	// Collection view to display themes
	private lazy var collectionView: UICollectionView = {
		let layout = PeekCarouselFlowLayout()
		let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
		collectionView.showsHorizontalScrollIndicator = false
		collectionView.translatesAutoresizingMaskIntoConstraints = false
		collectionView.backgroundColor = DesignManager.shared.darkItemColor
		collectionView.layer.cornerRadius = 10
		collectionView.delegate = self
		collectionView.dataSource = self
		collectionView.register(ThemeObjectCell.self, forCellWithReuseIdentifier: "ThemeCell")
		return collectionView
	}()
	
	// Page control to indicate current page
	private lazy var pageControl: UIPageControl = {
		let pageControl = UIPageControl()
		pageControl.translatesAutoresizingMaskIntoConstraints = false
		pageControl.numberOfPages = themeNames.count
		pageControl.currentPage = 0
		pageControl.pageIndicatorTintColor = DesignManager.shared.darkGrayTextColor.withAlphaComponent(0.5)
		pageControl.currentPageIndicatorTintColor = DesignManager.shared.darkGrayTextColor
		return pageControl
	}()
	
	// Array of theme names stored in assets
	private let themeNames = ["Light", "Classic", "Dark", "GrayScale", "Earth"]
	
	// MARK: - Lifecycle
	
	override func viewDidLoad() {
		super.viewDidLoad()
		setupView()
	}
	
	// MARK: - Setup Functions
	
	// Sets up the view by adding and laying out subviews
	private func setupView() {
		view.backgroundColor = .clear
		view.layer.cornerRadius = 10
		
		// Add and layout the collectionView
		view.addSubview(collectionView)
		NSLayoutConstraint.activate([
			collectionView.topAnchor.constraint(equalTo: view.topAnchor),
			collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
			collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
			collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
		])
		
		// Add and layout the pageControl
		view.addSubview(pageControl)
		NSLayoutConstraint.activate([
			pageControl.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -5),
			pageControl.centerXAnchor.constraint(equalTo: view.centerXAnchor),
			pageControl.heightAnchor.constraint(equalToConstant: 20)
		])
	}
	
	// MARK: - UICollectionViewDataSource
	
	// Returns the number of items in the section
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return themeNames.count
	}
	
	// Configures and returns the cell for a given index path
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ThemeCell", for: indexPath) as! ThemeObjectCell
		cell.configure(with: themeNames[indexPath.item])
		return cell
	}
	
	// MARK: - UICollectionViewDelegateFlowLayout
	
	// Determines the size for each item in the collection view
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
		let availableWidth = collectionView.frame.width
		let peekWidth = availableWidth * 0.25
		return CGSize(width: availableWidth - 2 * peekWidth, height: collectionView.frame.height)
	}
	
	// MARK: - UIScrollViewDelegate
	
	// Updates the page control when scrolling ends
	func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
		let pageWidth = scrollView.frame.width - 2 * (scrollView.frame.width * 0.25)
		let pageIndex = round(scrollView.contentOffset.x / pageWidth)
		pageControl.currentPage = Int(pageIndex)
	}
}

// MARK: - PeekCarouselFlowLayout

class PeekCarouselFlowLayout: UICollectionViewFlowLayout {
	
	// Percentage of the view width that should peek from the sides
	private let peekPercentage: CGFloat = 0.25
	
	override func prepare() {
		super.prepare()
		guard let collectionView = collectionView else { return }
		
		// Set scroll direction to horizontal
		scrollDirection = .horizontal
		
		let availableWidth = collectionView.bounds.width
		let peekWidth = availableWidth * peekPercentage
		
		// Set item size and section insets
		itemSize = CGSize(width: availableWidth - 2 * peekWidth, height: collectionView.bounds.height)
		sectionInset = UIEdgeInsets(top: 0, left: peekWidth, bottom: 0, right: peekWidth)
		minimumLineSpacing = 0
		
		// Disable paging to customize the scroll behavior
		collectionView.isPagingEnabled = false
	}
	
	override func shouldInvalidateLayout(forBoundsChange newBounds: CGRect) -> Bool {
		// Invalidate layout on bounds change to handle orientation changes
		return true
	}
	
	// Adjusts the target content offset to center the cell after scrolling
	override func targetContentOffset(forProposedContentOffset proposedContentOffset: CGPoint, withScrollingVelocity velocity: CGPoint) -> CGPoint {
		guard let collectionView = collectionView else {
			return super.targetContentOffset(forProposedContentOffset: proposedContentOffset, withScrollingVelocity: velocity)
		}
		
		let pageWidth = itemSize.width
		let collectionViewWidth = collectionView.bounds.width
		let proposedContentOffsetCenterX = proposedContentOffset.x + collectionViewWidth / 2.0
		
		// Find the index path of the item that should be centered
		let indexPath = collectionView.indexPathForItem(at: CGPoint(x: proposedContentOffsetCenterX, y: collectionView.bounds.height / 2.0)) ?? IndexPath(item: 0, section: 0)
		let cellRect = collectionView.layoutAttributesForItem(at: indexPath)?.frame ?? CGRect.zero
		
		// Adjust content offset to center the selected item
		let targetOffsetX = cellRect.origin.x - (collectionViewWidth - pageWidth) / 2.0
		return CGPoint(x: targetOffsetX, y: proposedContentOffset.y)
	}
}

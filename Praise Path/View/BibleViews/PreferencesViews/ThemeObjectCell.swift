import UIKit

class ThemeObjectCell: UICollectionViewCell {
	
	// MARK: - UI Elements
	
	// Preview image view for the theme
	private let previewImage: UIImageView = {
		let imageView = UIImageView()
		imageView.translatesAutoresizingMaskIntoConstraints = false
		imageView.contentMode = .scaleAspectFit
		return imageView
	}()
	
	// Label for the theme's title
	private let themeTitle: UILabel = {
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		label.font = DesignManager.shared.appFontSemiBold?.withSize(16)
		label.textColor = DesignManager.shared.darkGrayTextColor
		label.lineBreakMode = .byWordWrapping
		return label
	}()
	
	// MARK: - Initializers
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		setupView()
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	// MARK: - Setup Functions
	
	// Sets up the cell's view hierarchy and layout constraints
	private func setupView() {
		// Adding subviews to the contentView
		contentView.addSubview(previewImage)
		contentView.addSubview(themeTitle)
		
		// Setting up constraints
		NSLayoutConstraint.activate([
			// Center the preview image in the cell
			previewImage.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
			previewImage.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
			previewImage.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.70),
			previewImage.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.70),
			
			// Position the theme title above the preview image
			themeTitle.bottomAnchor.constraint(equalTo: previewImage.topAnchor, constant: -10),
			themeTitle.centerXAnchor.constraint(equalTo: previewImage.centerXAnchor),
		])
	}
	
	// Configures the cell with a theme name, setting the image and title
	func configure(with themeName: String) {
		previewImage.image = UIImage(named: themeName)
		themeTitle.text = themeName
	}
}

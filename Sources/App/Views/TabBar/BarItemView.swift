import UIKit

// MARK: - BarItemView
class BarItemView: UIView {
    // MARK: - Options
    private enum Options {
        static let minWidth: CGFloat = 65.scaleX
        static let maxWidth: CGFloat = 145.scaleX
    }

    // MARK: - Views
    lazy var indicatorView: UIView = .build()

    private lazy var labelTitle: UILabel = .build { label in
        label.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
    }

    private lazy var viewContainer: UIView = .build()

    // MARK: - Properties
    var widthConstraint: NSLayoutConstraint? = nil
    var titleLeadingConstraint: NSLayoutConstraint? = nil
    var button: BarButton!

    var isSelected: Bool = false {
        didSet {
            indicatorView.alpha = isSelected ? 1 : 0
            widthConstraint?.constant = isSelected ? Options.maxWidth : Options.minWidth
            
            labelTitle.alpha = isSelected ? 1 : 0
            titleLeadingConstraint?.isActive = isSelected
            button.isSelected = isSelected
        }
    }
    
    override var tintColor: UIColor! {
        set { labelTitle.textColor = newValue }
        get { return labelTitle.textColor }
    }
    
    override var backgroundColor: UIColor? {
        set { indicatorView.backgroundColor = newValue }
        get { return indicatorView.backgroundColor }
    }

    // MARK: - Init
    init(item: UITabBarItem) {
        super.init(frame: .zero)
        button = BarButton(forItem: item)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        labelTitle.text = item.title
        labelTitle.font = UIFont.appFont(size: 18, weight: .Bold)

        clipsToBounds = true
        setupConstraint()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - UI
    func setupConstraint() {
        addSubview(indicatorView)
        addSubview(viewContainer)
        viewContainer.addSubview(labelTitle)
        viewContainer.addSubview(button)

        NSLayoutConstraint.activate([
            viewContainer.leadingAnchor.constraint(equalTo: leadingAnchor),
            viewContainer.trailingAnchor.constraint(equalTo: trailingAnchor),
            viewContainer.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8.scaleX),
            viewContainer.topAnchor.constraint(equalTo: topAnchor, constant: 8.scaleX),

            indicatorView.leadingAnchor.constraint(equalTo: viewContainer.leadingAnchor),
            indicatorView.trailingAnchor.constraint(equalTo: viewContainer.trailingAnchor),
            indicatorView.bottomAnchor.constraint(equalTo: viewContainer.bottomAnchor),
            indicatorView.topAnchor.constraint(equalTo: viewContainer.topAnchor),
            
            button.leadingAnchor.constraint(equalTo: viewContainer.leadingAnchor, constant: 25.scaleX),
            button.centerYAnchor.constraint(equalTo: viewContainer.centerYAnchor),
            button.heightAnchor.constraint(equalTo: button.widthAnchor),
            
            labelTitle.centerYAnchor.constraint(equalTo: viewContainer.centerYAnchor),
            labelTitle.trailingAnchor.constraint(equalTo: viewContainer.trailingAnchor, constant: -4.scaleX),
        ])
        
        widthConstraint = viewContainer.widthAnchor.constraint(equalToConstant: 44.scaleX)
        widthConstraint?.isActive = true
        
        titleLeadingConstraint = labelTitle.leadingAnchor.constraint(equalTo: button.trailingAnchor, constant: 10.scaleX)
        titleLeadingConstraint?.isActive = true
    }

    // MARK: - Lifecycle
    override func layoutSubviews() {
        super.layoutSubviews()
        viewContainer.layer.cornerRadius = (viewContainer.bounds.height / 2).scaleX()
        indicatorView.layer.cornerRadius = (indicatorView.bounds.height / 2)
        button.layer.cornerRadius = (button.bounds.height / 2)
    }
}

// MARK: - BarButton
class BarButton: UIButton {
    // MARK: - Init
    init(forItem item: UITabBarItem) {
        super.init(frame: .zero)
        setImage(item.image, for: .normal)
        setImage(item.selectedImage, for: .selected)
    }

    init(image: UIImage){
        super.init(frame: .zero)
        setImage(image, for: .normal)
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    // MARK: - Lifecycle
    public override func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = (bounds.height / 2).scaleX()
    }
}

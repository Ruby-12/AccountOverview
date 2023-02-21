import UIKit

class SavingView: UIView {
    
    let label = UILabel()
    let subLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        style()
        layOut()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    lazy var stackView: UIStackView = {
        let view = UIStackView(arrangedSubviews: [label,subLabel])
        view.axis = .vertical
        view.alignment = .center
        view.spacing = 1
        view.backgroundColor = .none
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    
}
extension SavingView
{
    func style()
    {
        translatesAutoresizingMaskIntoConstraints = false
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Saving"
        
        
        subLabel.translatesAutoresizingMaskIntoConstraints = false
        subLabel.text = "76381641"
        
    }
    func layOut()
    {
        addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalToSystemSpacingAfter: centerXAnchor, multiplier: 1),
            stackView.centerYAnchor.constraint(equalToSystemSpacingBelow: centerYAnchor, multiplier: 1),
            bottomAnchor.constraint(equalToSystemSpacingBelow: stackView.bottomAnchor, multiplier: 1),
        ])
    }
    
}

import Foundation
import UIKit

class AccountTransactionCell: UITableViewCell
{
    var transactionDate = UILabel()
    var stackView1 = UIStackView()
    var amountLabel = UILabel()
    var stackView2 = UIStackView()
    var descriptionTrans = UILabel()
    var recipientName = UILabel()
    //var transactionType = UILabel()
    
    
    
    lazy var transactionDateView: UIStackView = {
        let view = UIStackView(arrangedSubviews: [transactionDate])
        view.axis = .vertical
        view.backgroundColor = .darkGray
        view.layer.cornerRadius = 5
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.black.cgColor
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        
        transactionDate.textColor = .white
        transactionDate.translatesAutoresizingMaskIntoConstraints = false
        transactionDate.numberOfLines = 0
        transactionDate.textAlignment = .center
        transactionDate.font = UIFont.systemFont(ofSize: 12)
        
        stackView1.translatesAutoresizingMaskIntoConstraints = false
        stackView1.axis = .vertical
        stackView1.spacing = 5
        
        amountLabel.textColor = .red
        amountLabel.font = UIFont.systemFont(ofSize: 15)
        
        stackView2.translatesAutoresizingMaskIntoConstraints = false
        stackView2.axis = .vertical
        stackView2.spacing = 5
        
        descriptionTrans.translatesAutoresizingMaskIntoConstraints = false
        descriptionTrans.font = UIFont.systemFont(ofSize: 15)
        descriptionTrans.lineBreakMode = .byCharWrapping
        descriptionTrans.widthAnchor.constraint(equalToConstant: 200).isActive = true
        
        
        recipientName.textColor = .gray
        recipientName.translatesAutoresizingMaskIntoConstraints = false
        recipientName.font = UIFont.systemFont(ofSize: 14)
        
        contentView.addSubview(transactionDateView)
        stackView1.addArrangedSubview(amountLabel)
        contentView.addSubview(stackView1)
        stackView2.addArrangedSubview(descriptionTrans)
        stackView2.addArrangedSubview(recipientName)
        contentView.addSubview(stackView2)
        
        NSLayoutConstraint.activate([
            transactionDateView.widthAnchor.constraint(equalToConstant: 50),
            transactionDateView.heightAnchor.constraint(equalToConstant: 50),
            transactionDateView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            transactionDateView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 5),
            contentView.trailingAnchor.constraint(equalTo: stackView1.trailingAnchor, constant: 0),
            stackView1.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            stackView2.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            stackView2.leadingAnchor.constraint(equalToSystemSpacingAfter: transactionDateView.trailingAnchor, multiplier: 0.5)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override var intrinsicContentSize: CGSize {
        return CGSize(width: 200, height: 200)
    }
}


import UIKit

class AccountDataView: UIView {
    
    let effAvailBalnc = UILabel()
    let balance = UILabel()
    let active = UILabel()
    let divider = UIView()
    
    let availBalance = UILabel()
    let balance2 = UILabel()
    let unClearLabel = UILabel()
    let unclerAmt = UILabel()
    let divider1 = UIView()
    
    let mmid = UILabel()
    let mmidNum = UILabel()
    let accName = UILabel()
    let name = UILabel()
    let divider2 = UIView()
    
    let nominee = UILabel()
    let nomYN = UILabel()
    let ifsc = UILabel()
    let ifscNum = UILabel()
    let divider3 = UIView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        style()
        layOut()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    lazy var stacHkView: UIStackView = {
        let view = UIStackView(arrangedSubviews: [balance, active])
        view.axis = .horizontal
        view.spacing = 5
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var stackVView: UIStackView = {
        let view = UIStackView(arrangedSubviews: [effAvailBalnc, stacHkView, divider])
        view.axis = .vertical
        view.spacing = 5
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .secondarySystemFill
        return view
    }()
    
    lazy var blnstackHView: UIStackView = {
        let view = UIStackView(arrangedSubviews: [availBalance, unClearLabel])
        view.axis = .horizontal
        view.spacing = 10
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    lazy var unStackHView: UIStackView = {
        let view = UIStackView(arrangedSubviews: [balance2, unclerAmt])
        view.axis = .horizontal
        view.spacing = 15
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    lazy var blnStackView: UIStackView = {
        let view = UIStackView(arrangedSubviews: [blnstackHView, unStackHView, divider1])
        view.axis = .vertical
        view.spacing = 5
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .secondarySystemFill
        return view
    }()
    
    lazy var blnstackHView1: UIStackView = {
        let view = UIStackView(arrangedSubviews: [mmid ,accName])
        view.axis = .horizontal
        view.spacing = 1
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    lazy var unStackHView1: UIStackView = {
        let view = UIStackView(arrangedSubviews: [mmidNum , name])
        view.axis = .horizontal
        view.spacing = 1
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    lazy var blnStackView1: UIStackView = {
        let view = UIStackView(arrangedSubviews: [blnstackHView1, unStackHView1, divider2])
        view.axis = .vertical
        view.spacing = 5
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var blnstackHView2: UIStackView = {
        let view = UIStackView(arrangedSubviews: [nominee ,ifsc])
        view.axis = .horizontal
        view.spacing = 1
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    lazy var unStackHView2: UIStackView = {
        let view = UIStackView(arrangedSubviews: [nomYN , ifscNum])
        view.axis = .horizontal
        view.spacing = 1
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    lazy var blnStackView2: UIStackView = {
        let view = UIStackView(arrangedSubviews: [blnstackHView2, unStackHView2, divider3])
        view.axis = .vertical
        view.spacing = 5
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    
}
extension AccountDataView
{
    func style()
    {
        translatesAutoresizingMaskIntoConstraints = false
        effAvailBalnc.translatesAutoresizingMaskIntoConstraints = false
        effAvailBalnc.text = "Effective Available Balance (INR)"
        effAvailBalnc.textColor = .gray
        effAvailBalnc.font = UIFont.systemFont(ofSize: 16)
        
        balance.translatesAutoresizingMaskIntoConstraints = false
        balance.text = "39,081.02"
        balance.textColor = .blue
        balance.font = UIFont.systemFont(ofSize: 15, weight: .heavy)
        
        active.translatesAutoresizingMaskIntoConstraints = false
        active.text = "Active"
        active.textColor = .systemGreen
        active.font = UIFont.systemFont(ofSize: 15)
        
        divider.translatesAutoresizingMaskIntoConstraints = false
        divider.backgroundColor = .gray
        
        availBalance.translatesAutoresizingMaskIntoConstraints = false
        availBalance.text = "Available Balance (INR)"
        availBalance.textColor = .gray
        availBalance.font = UIFont.systemFont(ofSize: 16)
        
        unClearLabel.translatesAutoresizingMaskIntoConstraints = false
        unClearLabel.text = "Uncleared (INR)"
        unClearLabel.textColor = .gray
        unClearLabel.font = UIFont.systemFont(ofSize: 16)
        
        unclerAmt.translatesAutoresizingMaskIntoConstraints = false
        unclerAmt.text = "0.00"
        unclerAmt.textColor = .systemRed
        unclerAmt.font = UIFont.systemFont(ofSize: 15, weight: .heavy)
        
        balance2.translatesAutoresizingMaskIntoConstraints = false
        balance2.text = "39,081.02"
        balance2.textColor = .systemGreen
        balance2.font = UIFont.systemFont(ofSize: 15)
        
        divider1.translatesAutoresizingMaskIntoConstraints = false
        divider1.backgroundColor = .gray
        
        mmid.translatesAutoresizingMaskIntoConstraints = false
        mmid.text = "MMID"
        mmid.textColor = .gray
        mmid.font = UIFont.systemFont(ofSize: 16)
        
        mmidNum.translatesAutoresizingMaskIntoConstraints = false
        mmidNum.text = "48926462"
        mmidNum.font = UIFont.systemFont(ofSize: 16)
        
        accName.translatesAutoresizingMaskIntoConstraints = false
        accName.text = "Account Name"
        accName.textColor = .gray
        accName.font = UIFont.systemFont(ofSize: 15)
        
        name.translatesAutoresizingMaskIntoConstraints = false
        name.text = "Rahul Kumar"
        name.font = UIFont.systemFont(ofSize: 15)
        
        divider2.translatesAutoresizingMaskIntoConstraints = false
        divider2.backgroundColor = .gray
        
        nominee.translatesAutoresizingMaskIntoConstraints = false
        nominee.text = "Nominee"
        nominee.textColor = .gray
        nominee.font = UIFont.systemFont(ofSize: 16)
        
        nomYN.translatesAutoresizingMaskIntoConstraints = false
        nomYN.text = "Yes"
        nomYN.font = UIFont.systemFont(ofSize: 16)
        
        ifsc.translatesAutoresizingMaskIntoConstraints = false
        ifsc.text = "IFSC"
        ifsc.textColor = .gray
        ifsc.font = UIFont.systemFont(ofSize: 15)
        
        ifscNum.translatesAutoresizingMaskIntoConstraints = false
        ifscNum.text = "KKBK0000825"
        ifscNum.font = UIFont.systemFont(ofSize: 15)
        
        divider3.translatesAutoresizingMaskIntoConstraints = false
        divider3.backgroundColor = .gray
    }
    
    func layOut()
    {
        addSubview(stackVView)
        addSubview(blnStackView)
        addSubview(blnStackView1)
        addSubview(blnStackView2)
        
        NSLayoutConstraint.activate([
            stackVView.topAnchor.constraint(equalToSystemSpacingBelow: topAnchor, multiplier: 1),
            
            stackVView.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 1),
            stackVView.trailingAnchor.constraint(equalToSystemSpacingAfter: trailingAnchor, multiplier: 1)
            
        ])
        divider.heightAnchor.constraint(equalToConstant: 1).isActive = true
        
        NSLayoutConstraint.activate([
            blnStackView.topAnchor.constraint(equalTo: stackVView.bottomAnchor),
            
            blnStackView.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 1),
            blnStackView.trailingAnchor.constraint(equalToSystemSpacingAfter: trailingAnchor, multiplier: 1)
        ])
        divider1.heightAnchor.constraint(equalToConstant: 1).isActive = true
        
        NSLayoutConstraint.activate([
            blnStackView1.topAnchor.constraint(equalTo: blnStackView.bottomAnchor),
            
            blnStackView1.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 1),
            blnStackView1.trailingAnchor.constraint(equalToSystemSpacingAfter: trailingAnchor, multiplier: 1)
        ])
        divider2.heightAnchor.constraint(equalToConstant: 1).isActive = true
        
        NSLayoutConstraint.activate([
            blnStackView2.topAnchor.constraint(equalTo: blnStackView1.bottomAnchor),
            
            blnStackView2.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 1),
            blnStackView2.trailingAnchor.constraint(equalToSystemSpacingAfter: trailingAnchor, multiplier: 1)
        ])
        divider3.heightAnchor.constraint(equalToConstant: 1).isActive = true
    }
    
}

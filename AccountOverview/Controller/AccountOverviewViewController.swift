import UIKit

class AccountOverviewViewController: UIViewController, UIScrollViewDelegate{
    
    let headview = SavingView()
    let accountDataView = AccountDataView()
    
    lazy var buttonOne: CustomButton = {
        let button = CustomButton(title: "View Transactions")
        return button
    }()
    
    lazy var buttonTwo: CustomButton = {
        let button = CustomButton(title: "Transfer Money")
        return button
    }()
    
    
    let textLabel = UILabel()
    let editButton = UIButton()
    
    lazy var stack: UIStackView = {
        let view = UIStackView(arrangedSubviews: [buttonOne, buttonTwo])
        view.axis = .vertical
        view.spacing = 12
        view.distribution = .fillEqually
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var LabelstackView: UIStackView = {
        let view = UIStackView(arrangedSubviews: [textLabel, editButton])
        view.axis = .horizontal
        view.spacing = 70
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var scrollView : UIScrollView = {
        let scrollview = UIScrollView()
        scrollview.backgroundColor = .white
        scrollview.translatesAutoresizingMaskIntoConstraints = false
        scrollview.delegate = self
        scrollview.contentSize = CGSize(width: self.view.frame.size.width, height: 1000)
        return scrollview
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationBar()
        changeStatusBarColor()
        style()
        layOut()
    }
    
    override func viewDidLayoutSubviews() {
           super.viewDidLayoutSubviews()
           let layout = view.safeAreaLayoutGuide
           scrollView.centerXAnchor.constraint(equalTo: layout.centerXAnchor).isActive = true
           scrollView.centerYAnchor.constraint(equalTo: layout.centerYAnchor).isActive = true
           scrollView.widthAnchor.constraint(equalTo: layout.widthAnchor).isActive = true
           scrollView.heightAnchor.constraint(equalTo: layout.heightAnchor).isActive = true
       }
}

extension AccountOverviewViewController
{
    func style()
    {
        
        headview.translatesAutoresizingMaskIntoConstraints = false
        headview.backgroundColor = .lightGray
        
        accountDataView.translatesAutoresizingMaskIntoConstraints = false
        
        buttonOne.addTarget(self, action: #selector(goToTransactionScreen), for: .touchUpInside)
        buttonTwo.addTarget(self, action: #selector(goToNextScreen), for: .touchUpInside)
        
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        textLabel.text = "Your Siri Shortcut is:\nCheck my Kotak\nBank Balance"
        textLabel.textColor = .gray
        textLabel.font = UIFont.systemFont(ofSize: 14)
        textLabel.numberOfLines = 0
        
        editButton.translatesAutoresizingMaskIntoConstraints = false
        editButton.setTitle("Edit", for: .normal)
        editButton.setTitleColor(.black, for: .normal)
        editButton.layer.cornerRadius = 5
        editButton.layer.borderWidth = 0.5
        editButton.addTarget(self, action: #selector(editButtonClicked), for: .touchUpInside)
        
    }
    func layOut()
    {
        view.addSubview(scrollView)
        
        scrollView.addSubview(headview)
        scrollView.addSubview(accountDataView)
        scrollView.addSubview(stack)
        scrollView.addSubview(LabelstackView)
        
        NSLayoutConstraint.activate([
            headview.topAnchor.constraint(equalToSystemSpacingBelow: view.topAnchor, multiplier: 14),
            headview.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 2),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: headview.trailingAnchor, multiplier: 2),
            
        ])
        
        NSLayoutConstraint.activate([
            accountDataView.topAnchor.constraint(equalToSystemSpacingBelow: headview.bottomAnchor, multiplier: 1),
            accountDataView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            view.trailingAnchor.constraint(equalTo: accountDataView.trailingAnchor, constant: 15),
            accountDataView.bottomAnchor.constraint(equalTo: view.topAnchor, constant: 200)
        ])
        
        NSLayoutConstraint.activate([
            stack.topAnchor.constraint(equalToSystemSpacingBelow: accountDataView.bottomAnchor, multiplier: 25),
            stack.leadingAnchor.constraint(equalTo: accountDataView.leadingAnchor, constant: 40),
            accountDataView.trailingAnchor.constraint(equalTo: stack.trailingAnchor, constant: 10)
        ])
        
        NSLayoutConstraint.activate([
            LabelstackView.topAnchor.constraint(equalToSystemSpacingBelow: stack.bottomAnchor, multiplier: 2),
            LabelstackView.leadingAnchor.constraint(equalTo: stack.leadingAnchor, constant: 0),
            stack.trailingAnchor.constraint(equalTo: LabelstackView.trailingAnchor, constant: 20)
        ])
    }
    
    @objc func goToTransactionScreen(){
        let transactionScreen = AccountActivityTableView()
        navigationController?.pushViewController(transactionScreen, animated: false)
        navigationItem.backButtonTitle = ""
        navigationController?.navigationBar.tintColor = .white
    }
   
    @objc func goToNextScreen(){
        let nextScreen = TransferMoneyView()
        nextScreen.title = "Here you can view the details of transfer"
        navigationController?.pushViewController(nextScreen, animated: false)
    }
    @objc func editButtonClicked(){
        let nextScreen = TransferMoneyView()
        nextScreen.title = "Edit"
        navigationController?.pushViewController(nextScreen, animated: false)
    }
    
    func setNavigationBar() {
        let width = self.view.frame.width
        let startingYPos = UIApplication.shared.statusBarFrame.size.height;
        let navigationbar = UINavigationBar(frame: CGRect(x: 0, y: startingYPos, width: self.view.bounds.width, height: 0));
        let navItem = UINavigationItem(title: "Account Overview")
        
        
       // let leftbackButton = UIBarButtonItem(image: UIImage(systemName: "chevron.left"), style: .plain, target: nil, action: nil)
        
        //navigationbar.tintColor = .white
        //navItem.leftBarButtonItem = leftbackButton
        
        UINavigationBar.appearance().barTintColor = .init(red: 1, green: 0.1, blue: 0.1, alpha: 1)
        UINavigationBar.appearance().titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        UINavigationBar.appearance().isTranslucent = false
        navigationbar.setItems([navItem], animated: false)
        view.addSubview(navigationbar)
    }
    
    func changeStatusBarColor() {
        if #available(iOS 13.0, *) {
            let app = UIApplication.shared
            let statusBarHeight: CGFloat = app.statusBarFrame.size.height
            
            let statusbarView = UIView()
            statusbarView.backgroundColor = .init(red: 1, green: 0.1, blue: 0.1, alpha: 1)
            view.addSubview(statusbarView)
            
            statusbarView.translatesAutoresizingMaskIntoConstraints = false
            statusbarView.heightAnchor
                .constraint(equalToConstant: statusBarHeight).isActive = true
            statusbarView.widthAnchor
                .constraint(equalTo: view.widthAnchor, multiplier: 1.0).isActive = true
            statusbarView.topAnchor
                .constraint(equalTo: view.topAnchor).isActive = true
            statusbarView.centerXAnchor
                .constraint(equalTo: view.centerXAnchor).isActive = true
            
        } else {
            let statusBar = UIApplication.shared.value(forKeyPath: "statusBarWindow.statusBar") as? UIView
            statusBar?.backgroundColor = .red
        }
    }
    
}

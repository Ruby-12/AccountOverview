import UIKit

class AccountActivityTableView: UIViewController {
    
    let headview = SavingView()
    
    private let tableView = UITableView(frame: CGRect(), style: .plain)
    
    private var data = AccountApi().getAccountActivityData()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        changeStatusBarColor()
        setNavigationBar()
        
         style()
         layout()
        
    }
}
extension AccountActivityTableView: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! AccountTransactionCell
        
        cell.amountLabel.text = data[indexPath.row].description
        cell.amountLabel.numberOfLines = 0
        cell.repeatImageLabel.text = data[indexPath.row].amount
        cell.recipientName.text = "Chq/Ref No.: UPI-\(data[indexPath.row].referenceNumber)"
        cell.transactionDate.text = data[indexPath.row].date
        cell.backgroundColor = UIColor(red: 234/255, green: 235/255, blue: 237/255, alpha: 1)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
}
extension AccountActivityTableView
{
    func style()
    {
        headview.translatesAutoresizingMaskIntoConstraints = false
        headview.backgroundColor = .lightGray
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(AccountTransactionCell.self, forCellReuseIdentifier: "cell")
        tableView.dataSource = self
        tableView.delegate = self
        tableView.separatorInset = .zero
        tableView.backgroundColor = UIColor(red: 234/255, green: 235/255, blue: 237/255, alpha: 1)
    }
    func layout()
    {
        view.addSubview(headview)
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            headview.topAnchor.constraint(equalToSystemSpacingBelow: view.topAnchor, multiplier: 14),
            headview.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 2),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: headview.trailingAnchor, multiplier: 2),
            
        ])

        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalToSystemSpacingBelow: headview.topAnchor, multiplier: 20),
            tableView.leftAnchor.constraint(equalTo:view.leftAnchor, constant: 10),
            tableView.rightAnchor.constraint(equalTo:view.rightAnchor, constant: -10),
            tableView.bottomAnchor.constraint(equalTo:view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}

extension AccountActivityTableView
{
    func setNavigationBar() {
        let width = self.view.frame.width
        let startingYPos = UIApplication.shared.statusBarFrame.size.height;
        let navigationbar = UINavigationBar(frame: CGRect(x: 0, y: startingYPos, width: self.view.bounds.width, height: 0));
        let navItem = UINavigationItem(title: "Account Activity")
        
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

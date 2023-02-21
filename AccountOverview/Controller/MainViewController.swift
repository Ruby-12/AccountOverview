import UIKit

class MainViewController: UIViewController {

    let launchBtn = UIButton(type: .system)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        style()
        layout()
    }
    
    func style()
    {
        launchBtn.translatesAutoresizingMaskIntoConstraints = false
        launchBtn.setTitle("Launch Account Overview", for: .normal)
        launchBtn.configuration = .filled()
        launchBtn.tintColor = .init(red: 1, green: 0.1, blue: 0.1, alpha: 1)
        launchBtn.addTarget(self, action: #selector(launchbuttonTapped(_:)), for: .touchUpInside)
    }
    
    func layout()
    {
        view.addSubview(launchBtn)
        
        NSLayoutConstraint.activate([
            launchBtn.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            launchBtn.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
    @objc func launchbuttonTapped(_ sender: UIButton) {
        let accountOverView = AccountOverviewViewController()
        navigationController?.pushViewController(accountOverView, animated: true)
        navigationItem.backButtonTitle = ""
        navigationController?.navigationBar.tintColor = .white
    }
}

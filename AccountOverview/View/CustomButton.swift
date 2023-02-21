import Foundation
import UIKit

class CustomButton: UIButton {
    
    override init(frame: CGRect){
        super.init(frame: frame)
    }
    
    init(title: String){
        super.init(frame: .zero)
        backgroundColor = .lightGray
        setTitle(title, for: .normal)
        setTitleColor(.black, for: .normal)
        layer.cornerRadius = 4
        heightAnchor.constraint(equalToConstant: 45).isActive = true
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

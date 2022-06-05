//
//  Header.swift
//  ForExample
//
//  Created by Руслан Штыбаев on 05.06.2022.
//

import Foundation
import UIKit

class HeaderForPeople: UICollectionReusableView {
    let label = UILabel()
    let button = UIButton()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        label.text = "Send Money"
        label.font = UIFont(name: "Avenir Next", size: 16)
        
        
        button.setImage(UIImage(named: "qrcode.viewfinder"), for: .normal)
       
        
        addSubview(label)
        addSubview(button)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        label.frame = CGRect(x: 25, y: 20, width: 94, height: 25)
        button.frame = CGRect(x: 15, y: 20, width: 24, height: 24)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init coder has not been emplemented")
    }
}

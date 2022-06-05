//
//  SectionTwoButtonCell.swift
//  ForExample
//
//  Created by Руслан Штыбаев on 05.06.2022.
//

import UIKit

class SectionTwoButtonCell: UICollectionViewCell {
    @IBOutlet var backView: UIView!
    @IBOutlet weak var button: UIButton! {
        didSet {
            button.frame = CGRect(x: 0, y: 0, width: 52, height: 52)
            button.layer.cornerRadius = 0.5 * button.bounds.size.width
            button.clipsToBounds = true
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        backView.layer.cornerRadius = backView.frame.width/2
//        let button = UIButton(type: .custom)
//            button.frame = CGRect(x: 160, y: 100, width: 50, height: 50)
//            button.layer.cornerRadius = 0.5 * button.bounds.size.width
//            button.clipsToBounds = true
//            button.setImage(UIImage(named:"thumbsUp.png"), for: .normal)
//            button.addTarget(self, action: #selector(thumbsUpButtonPressed), for: .touchUpInside)
//            view.addSubview(button)
    }
    
}

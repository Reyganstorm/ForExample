//
//  SectoinOneCell.swift
//  ForExample
//
//  Created by Руслан Штыбаев on 05.06.2022.
//

import UIKit

class SectoinOneCell: UICollectionViewCell {
    
    
    @IBOutlet var backView: UIView!
    @IBOutlet var moneyCountLabel: UILabel!
    @IBOutlet var button: UIButton! {
        didSet {
            button.frame = CGRect(x: 0, y: 0, width: 48, height: 48)
            button.layer.cornerRadius = 0.5 * button.bounds.size.width
            button.clipsToBounds = true
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        backView.layer.cornerRadius = 12
    }
    
    
}

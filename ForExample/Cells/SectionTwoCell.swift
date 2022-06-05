//
//  SectionTwoCell.swift
//  ForExample
//
//  Created by Руслан Штыбаев on 05.06.2022.
//

import UIKit

class SectionTwoCell: UICollectionViewCell {
    
    @IBOutlet var backView: UIView!
    @IBOutlet var portraitView: UIView!
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var nameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        backView.layer.cornerRadius = 12
        portraitView.layer.cornerRadius = portraitView.bounds.width/2
    }
    
    func configuration(contact: Contact) {
        self.imageView.image = UIImage(named: contact.image)
        self.nameLabel.text = contact.name
    }
}

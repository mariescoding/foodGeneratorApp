//
//  browseCollectionViewCell.swift
//  SeedsApp
//
//  Created by Marie Muramatsu on 8/6/23.
//

import UIKit

class browseCollectionViewCell: UICollectionViewCell {
    
   @IBOutlet var menuName: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        
        menuName.layer.borderWidth = 4
        menuName.layer.borderColor = UIColor.black.cgColor
        menuName.layer.cornerRadius = 25
        
        
        
        // Initialization code
    }

}

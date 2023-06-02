//
//  MenuTableViewCell.swift
//  SeedsApp
//
//  Created by Marie Muramatsu on 2/6/23.
//

import UIKit

class MenuTableViewCell: UITableViewCell {
    
    @IBOutlet var menuName: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

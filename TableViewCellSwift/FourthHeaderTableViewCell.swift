//
//  FourthHeaderTableViewCell.swift
//  TableViewCellSwift
//
//  Created by anki on 4/16/17.
//  Copyright © 2017 IOS. All rights reserved.
//

import UIKit

class FourthHeaderTableViewCell: UITableViewCell {

    @IBOutlet weak var headerLabel: UILabel!
    
    @IBOutlet weak var headerImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

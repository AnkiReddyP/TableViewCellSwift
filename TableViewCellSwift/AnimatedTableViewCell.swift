//
//  AnimatedTableViewCell.swift
//  TableViewCellSwift
//
//  Created by anki on 4/21/17.
//  Copyright © 2017 IOS. All rights reserved.
//

import UIKit

class AnimatedTableViewCell: UITableViewCell {

    
    @IBOutlet weak var labelAnimated: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

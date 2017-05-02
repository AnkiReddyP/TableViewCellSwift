//
//  AnimatedRowTableViewCell.swift
//  TableViewCellSwift
//
//  Created by anki on 4/21/17.
//  Copyright © 2017 IOS. All rights reserved.
//

import UIKit

class AnimatedRowTableViewCell: UITableViewCell {

    @IBOutlet weak var labelAnimatedCell: UILabel!
    
    @IBOutlet weak var imageAnimatedCell: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

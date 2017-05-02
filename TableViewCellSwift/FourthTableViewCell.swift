//
//  FourthTableViewCell.swift
//  TableViewCellSwift
//
//  Created by anki on 4/16/17.
//  Copyright © 2017 IOS. All rights reserved.
//

import UIKit

class FourthTableViewCell: UITableViewCell {

    @IBOutlet weak var imageView1: UIImageView!
    
    @IBOutlet weak var label1: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

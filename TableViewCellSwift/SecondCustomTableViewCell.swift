//
//  SecondCustomTableViewCell.swift
//  TableViewCellSwift
//
//  Created by anki on 4/15/17.
//  Copyright © 2017 IOS. All rights reserved.
//

import UIKit

class SecondCustomTableViewCell: UITableViewCell {
    
    @IBOutlet weak var label_TVC: UILabel!
    
    @IBOutlet weak var myImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}

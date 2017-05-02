//
//  JSONDataTableViewCell.swift
//  TableViewCellSwift
//
//  Created by anki on 4/20/17.
//  Copyright © 2017 IOS. All rights reserved.
//

import UIKit

class JSONDataTableViewCell: UITableViewCell {

    @IBOutlet weak var imageURl: UIImageView!
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var dobLabel: UILabel!
    
    @IBOutlet weak var countryLabel: UILabel!
    
    @IBOutlet weak var heightLabel: UILabel!
    
    @IBOutlet weak var spouseLabel: UILabel!
    
    @IBOutlet weak var childrensLabel: UILabel!
    
    @IBOutlet weak var descriptionLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

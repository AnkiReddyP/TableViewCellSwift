//
//  FourthTableViewController.swift
//  TableViewCellSwift
//
//  Created by anki on 4/16/17.
//  Copyright © 2017 IOS. All rights reserved.
//

import UIKit

struct 	postStruct {
    var image: UIImage!
    var name: String!
}

var heightForHeader: CGFloat = 43

class FourthTableViewController: UITableViewController {
    
    @IBOutlet weak var tableview1: UITableView!
    
    var arrayOfPostStruct = [postStruct]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        arrayOfPostStruct = [postStruct.init(image: #imageLiteral(resourceName: "Animals.jpg"), name: "Animals"),postStruct.init(image: #imageLiteral(resourceName: "Animals1.jpg"), name: "Animals1"),postStruct.init(image: #imageLiteral(resourceName: "Animals2.jpg"), name: "Animals2"),postStruct.init(image: #imageLiteral(resourceName: "Cock.jpg"), name: "Cock"),postStruct.init(image: #imageLiteral(resourceName: "Dog.jpg"), name: "Dog"),postStruct.init(image: #imageLiteral(resourceName: "DogMen.jpg"), name: "DogMen"),postStruct.init(image: #imageLiteral(resourceName: "Dogs.jpg"), name: "Dogs"),postStruct.init(image: #imageLiteral(resourceName: "Dogs1.jpg"), name: "Dogs1"),postStruct.init(image: #imageLiteral(resourceName: "Elephant.jpg"), name: "Elephant"),postStruct.init(image: #imageLiteral(resourceName: "Lion.jpg"), name: "Lion"),postStruct.init(image: #imageLiteral(resourceName: "Parroat.jpg"), name: "Parrot"),postStruct.init(image: #imageLiteral(resourceName: "Rabbit.jpg"), name: "Rabbit"),postStruct.init(image: #imageLiteral(resourceName: "ColourImage"), name: "ColourImage"),postStruct.init(image: #imageLiteral(resourceName: "Banana"), name: "Banana"),postStruct.init(image: #imageLiteral(resourceName: "Camel"), name: "Camel"),postStruct.init(image: #imageLiteral(resourceName: "CockBirds"), name: "CockBirds"),postStruct.init(image: #imageLiteral(resourceName: "Eagle"), name: "Eagle"),postStruct.init(image: #imageLiteral(resourceName: "Fish"), name: "Fish"),postStruct.init(image: #imageLiteral(resourceName: "Horse"), name: "Horse"),postStruct.init(image: #imageLiteral(resourceName: "Leaf"), name: "Leaf"),postStruct.init(image: #imageLiteral(resourceName: "Leafs"), name: "Leafs"),postStruct.init(image: #imageLiteral(resourceName: "Nature"), name: "Nature"),postStruct.init(image: #imageLiteral(resourceName: "Nature1"), name: "Nature1"),postStruct.init(image: #imageLiteral(resourceName: "PenGuin"), name: "PenGuin"),postStruct.init(image: #imageLiteral(resourceName: "PolarBear"), name: "PolarBear"),postStruct.init(image: #imageLiteral(resourceName: "Rat"), name: "Rat"),postStruct.init(image: #imageLiteral(resourceName: "Tree"), name: "Tree"),postStruct.init(image: #imageLiteral(resourceName: "WhiteCat"), name: "WhiteCat")]
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
         print("pets is : \(arrayOfPostStruct.count)")
        // out of boundary expressoin is there if u call
        //  return arrayOfPostStruct.count - 1
        
        return arrayOfPostStruct.count
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 1
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        return heightForHeader
        
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! FourthTableViewCell
        
        cell.imageView1.image = UIImage(named: (pets[indexPath.section] + ".jpg"))
        print((arrayOfPostStruct[indexPath.row] as postStruct).name)
        cell.label1.text = pets[indexPath.section]
        print("pets is : \(pets.count)")

        
        // Configure the cell...
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let headerView = Bundle.main.loadNibNamed("FourthHeaderTableViewCell", owner: self, options: nil)?.first as! FourthHeaderTableViewCell
        /*
         headerView.layer.cornerRadius = 15
         headerView.layer.borderColor = UIColor.lightGray.cgColor
         headerView.layer.borderWidth = 10
         */
        headerView.headerImageView.image = arrayOfPostStruct[section].image
        headerView.headerLabel.text = arrayOfPostStruct[section].name
        
        return headerView
    }
    
}






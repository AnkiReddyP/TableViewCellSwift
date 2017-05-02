//
//  CocoaPodsSDWebImages.swift
//  TableViewCellSwift
//
//  Created by anki on 4/22/17.
//  Copyright © 2017 IOS. All rights reserved.
//

import UIKit

class CocoaPodsSDWebImages: UITableViewController {
    
    var imageURLs = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageURLs = ["http://www.hindustantimes.com/rf/image_size_960x540/HT/p2/2017/04/21/Pictures/_3d7079b6-263b-11e7-b743-a11580b053fc.jpg","http://4.bp.blogspot.com/_GNE95R2Gmjs/Sp7amTL6g6I/AAAAAAAABLA/6Q6nn6Is9Tk/s400/ysr.jpg","http://2.bp.blogspot.com/_1q0fHNsCbCc/SqUuVBtK5AI/AAAAAAAAADY/fUJdLXv-YOo/s320/yeduguri-sandinti-rajasekhara-reddy-23.jpg","http://1.bp.blogspot.com/_Ptr2JtTY3rk/SqUV3XTANnI/AAAAAAAAD2M/tKxKrM5JiWw/S1600-R/Y+S+Jagan+Mohan+reddy.jpg","http://photogallery.indiatimes.com/photo/4966568.cms","http://2.bp.blogspot.com/_Ptr2JtTY3rk/SqI8MsILB9I/AAAAAAAAD1E/zOGdmSiI8rw/s400/20090905a_010101009.jpg","http://3.bp.blogspot.com/_1q0fHNsCbCc/SqUudFFjg8I/AAAAAAAAADg/pCuxn2cL6m8/s320/yeduguri-sandinti-rajasekhara-reddy-10.jpg","http://images.indianexpress.com/2009/09/m_id_106351_death.jpg?w=300","http://4.bp.blogspot.com/_Ptr2JtTY3rk/SqI3i88EUvI/AAAAAAAADyM/jhH_PODZH28/s400/D28639358.jpg","http://specials.rediff.com/election/2004/may/12sld6.jpg","https://americanteluguassociation.org/pictures/events/DSC_00752.jpg","https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTqNwsLSZlmWYZBuzEdF8siVTYv-hwe1rtvae-9pr6wWDVPaEx1","http://innlivenews.in/wp-content/uploads/2013/08/Bharati-not-allowed-to-meet-Jagan-on-anniversary-620x330.jpg","https://ysrexclusive.files.wordpress.com/2009/02/cm-targets-actor-politicians-2.jpg?w=500","http://images.indianexpress.com/2015/02/jagan.jpg?w=728","http://2.bp.blogspot.com/_M1xRTkiDy9k/TCwZEghNMNI/AAAAAAAAAAk/yQOc4LAp5Mg/S380/yeduguri-sandinti-rajasekhara-reddy-24.jpg","http://specials.rediff.com/election/2004/may/12sld8.jpg"]
        
    }
    
    @IBAction func refreshBtn(_ sender: AnyObject) {
        
            self.tableView.reloadData()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    // MARK: - numberOfRowsInSection
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return imageURLs.count
    }
    
    // MARK: - cellForRowAt indexPath
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        let imageView = cell.viewWithTag(1) as! UIImageView
        imageView.sd_setImage(with: URL(string: imageURLs[indexPath.row]))
        
        // Configure the cell...
        
        return cell
    }
    
}

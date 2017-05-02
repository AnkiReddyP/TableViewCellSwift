//
//  AnimatedRow.swift
//  TableViewCellSwift
//
//  Created by anki on 4/21/17.
//  Copyright © 2017 IOS. All rights reserved.
//

import UIKit

var ysrPicsArray = ["Ysr","Ysr1","Ysr2","Ysr3","Ysr4","Ysr5","Ysr6","Ysr7","Ysr8","Ysr9","Ysr10","Ysr11","Ysr12","Ysr13","Ysr14","Ysr15","Jagan","Jagan1","Jagan2"]

var ysrAboutArray = ["Dr. Yeduguri Shantanu Rajasekhara Reddy","YSR, was a two-time Chief Minister of the Indian state of Andhra Pradesh"," serving from 2004 to 2009.","Reddy was elected to the 9th, 10th, 11th, and 12th Lok Sabha from the Kadapa"," constituency for four terms and to the Andhra Pradesh Assembly for five terms from the Pulivendula constituency.","In 2003 he undertook a three-month-long paadayaatra, or walking tour of 1475 km during the very hot summer months"," across several districts in Andhra Pradesh as a part of his election campaign.","He led his party to victory in the following general and assembly elections held in 2004, and did the same in 2009.","On 2 September 2009, a helicopter carrying Reddy went missing in the Nallamala Forest area."," The next morning media reported that the helicopter wreckage had been found on top of Rudrakonda Hill, 40 kilometres (25 mi) from Kurnool.", "The five people aboard were pronounced dead at the scene of the crash.","Over a hundred people were reported to have committed suicide on hearing the news of his death","Being born into a Christian middle class family on 8 July 1949 as eldest of five sons for Y. V. Raja Reddy at Pulivendula"," he completed his medical studies in Mahadevappa Rampure Medical College, Gulbarga, Karnataka and served as medical officer as Jammalamadugu Mission Hospital, Jammalamadugu, Kadapa district, Andhra Pradesh after completing his studies."," In 1973, he established a 70-bed charitable hospital before joining into politics.","Reddy was married to Vijaya Lakshmi.[8] They had one son, politician"," Y. S. Jagan Mohan, and one daughter, Y. S. Sharmila.[9][10] Reddy's younger brother Y. S. Vivekananda is also a Congress (I) politician.","Reddy's parents were devout Christians, as was Reddy, who was buried according to Christian rites."," Reddy visited Bethlehem and other historically important Christian places in Israel twice. He also visited the Hindu temple of Tirupati regularly."]

class AnimatedRow: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        tableView.estimatedRowHeight = 100;
        print("Ysr array count is : \(ysrAboutArray.count)")
        
        return ysrAboutArray.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! AnimatedRowTableViewCell
        
        cell.imageAnimatedCell.image = UIImage(named: (ysrPicsArray[indexPath.row] + ".jpg"))
        cell.labelAnimatedCell.text = ysrAboutArray[indexPath.row]
        
        // cell?.textLabel?.text = arrayNames[indexPath.row]
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
        let x:CGFloat = 0.0
        let y:CGFloat = 0.0
        let z:CGFloat = 1.0
        
        var rotation = CATransform3DMakeRotation(CGFloat(90*Double.pi/180), x, y, z)
        rotation.m34 = 1 / -500
        cell.contentView.layer.transform = rotation
        cell.contentView.layer.anchorPoint = CGPoint(x:0, y:0)
        UIView.beginAnimations("rotation", context: nil)
        UIView.setAnimationDuration(0.5)
        cell.contentView.layer.transform = CATransform3DIdentity
        UIView.commitAnimations()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

//
//  JSONDataImageViewController.swift
//  TableViewCellSwift
//
//  Created by anki on 4/20/17.
//  Copyright © 2017 IOS. All rights reserved.
//

import UIKit

class JSONDataImageViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    final let urlString = "http://microblogging.wingnity.com/JSONParsingTutorial/jsonActors"
    
    @IBOutlet weak var tableView: UITableView!
    
    var nameArray = [String]()
    var dobArray = [String]()
    var imgURLArray = [String]()
    var countryArray = [String]()
    var heightArray = [String]()
    var spouseArray = [String]()
    var childrensArray = [String]()
    var descriptionArray = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.downloadJSONWithUrl()
        // Do any additional setup after loading the view.
    }

    func downloadJSONWithUrl(){
        
        let url = NSURL(string: urlString)
        URLSession.shared.dataTask(with: (url as URL?)!) { (data, response, error) in
            
            if let jsonObj = try? JSONSerialization.jsonObject(with: data!, options: .allowFragments) as? NSDictionary {
                
                print(jsonObj!.value(forKey: "actors") ?? String())
                
                if let actorArray = jsonObj!.value(forKey: "actors") as? NSArray {
                    for actor in actorArray {
                        if let actorDict = actor as? NSDictionary {
                            
                            if let name = actorDict.value(forKey: "name") {
                                self.nameArray.append(name as! String)
                            }
                            
                            if let dob = actorDict.value(forKey: "dob") {
                                self.dobArray.append(dob as! String)
                            }
                            
                            if let imageString = actorDict.value(forKey: "image") {
                                self.imgURLArray.append(imageString as! String)
                            }
                            
                            if let countryString = actorDict.value(forKey: "country") {
                                self.countryArray.append(countryString as! String)
                            }
                            
                            if let heightString = actorDict.value(forKey: "height") {
                                self.heightArray.append(heightString as! String)
                            }
                            
                            if let spouseString = actorDict.value(forKey: "spouse") {
                                self.spouseArray.append(spouseString as! String)
                            }
                            
                            if let childrensString = actorDict.value(forKey: "children") {
                                self.childrensArray.append(childrensString as! String)
                            }
                            
                            if let descriptionString = actorDict.value(forKey: "description") {
                                self.descriptionArray.append(descriptionString as! String)
                            }
                            
                            OperationQueue.main.addOperation ({
                                self.tableView.reloadData()
                            })
                            
                        }
                    }
                }
                
            }
            
        }.resume()
    }
    
    func downloadJSONWithTask() {
        
        let url = NSURL(string: urlString)
        
        var downloadTask = URLRequest(url: (url as URL?)!, cachePolicy: URLRequest.CachePolicy.reloadIgnoringCacheData, timeoutInterval: 20)
        
        downloadTask.httpMethod = "GET"
        
        URLSession.shared.dataTask(with: downloadTask) { (data, response, error) in
            
            let jsonData = try? JSONSerialization.jsonObject(with: data!, options: .allowFragments)
            print(jsonData as Any)
            
        }.resume()
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
         tableView.estimatedRowHeight = 180;
        return nameArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! JSONDataTableViewCell
        
        cell.nameLabel.text = nameArray[indexPath.row]
        cell.dobLabel.text = dobArray[indexPath.row]
        cell.countryLabel.text = countryArray[indexPath.row]
        cell.heightLabel.text = heightArray[indexPath.row]
        cell.spouseLabel.text = spouseArray[indexPath.row]
        cell.childrensLabel.text = childrensArray[indexPath.row]
        cell.descriptionLabel.text = descriptionArray[indexPath.row]
        
        let imgURL = NSURL(string: imgURLArray[indexPath.row])
        
        if imgURL != nil {
            
            let data = NSData(contentsOf: (imgURL as URL?)!)
            
            cell.imageURl.image = UIImage(data: data! as Data)
        }
        
        if indexPath.row % 2 == 0
                {
                    cell.backgroundColor = UIColor.cyan
                }
                else
                {
                    cell.backgroundColor = UIColor.clear
                }
        
        return cell
        
    }
    
//    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
//        
//        let x:CGFloat = 0.0
//        let y:CGFloat = 0.0
//        let z:CGFloat = 1.0
//        
//        var rotation = CATransform3DMakeRotation(CGFloat(90*M_PI/180), x, y, z)
//        rotation.m34 = 1 / -500
//        cell.contentView.layer.transform = rotation
//        cell.contentView.layer.anchorPoint = CGPoint(x:0, y:0)
//        UIView.beginAnimations("rotation", context: nil)
//        UIView.setAnimationDuration(0.5)
//        cell.contentView.layer.transform = CATransform3DIdentity
//        UIView.commitAnimations()
//    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

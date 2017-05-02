//
//  CoreDataViewController.swift
//  TableViewCellSwift
//
//  Created by anki on 4/18/17.
//  Copyright © 2017 IOS. All rights reserved.
//

import UIKit
import CoreData

class CoreDataViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var dataArray = [Users]()
    
    @IBOutlet weak var textFild1: UITextField!
    
    @IBOutlet weak var textField2: UITextField!
    
    var data = [Users]()
    
    @IBOutlet weak var label1: UILabel!
    
    @IBOutlet weak var label2: UILabel!
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBAction func enterButton(_ sender: AnyObject) {
        
        insertData()
        dataArray.removeAll()
        fetchData()
        
        // convert text to label
        label1.text = textFild1.text
        label2.text = textField2.text
        
        // text is empty
        textFild1.text = ""
        textField2.text = ""
        // Reload TableData
        tableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fetchData()
        
        // Reload TableData
        tableView.reloadData()
        // Do any additional setup after loading the view.
    }
    
    func insertData()
    {
        
        let user = Users(context: context)
        user.name = textFild1.text
        
        print("name: \(String(describing: textFild1.text))")
        print("age: \(String(describing: textField2.text))")
        
        let age = Int(textField2.text!)
        user.age = Int64(age!)
        
        appDelegate.saveContext()
        
    }
    
    func fetchData()
    {
        
        do{
            data = try context.fetch(Users.fetchRequest())
            
            for user: Users in data
            {
                dataArray.append(user)
            }
        }
        catch
        {
            print("Handle error")
        }
        tableView.reloadData()
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return dataArray.count;
    }
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        let aUser = dataArray[indexPath.row]
        cell.textLabel?.text = aUser.name
        cell.detailTextLabel?.text = String(aUser.age)
        return cell
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

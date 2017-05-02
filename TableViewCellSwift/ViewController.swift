//
//  ViewController.swift
//  TableViewCellSwift
//
//  Created by anki on 4/14/17.
//  Copyright © 2017 IOS. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate {
    
    var arrayOfNumbers = ["Table1","Table2","Table3","Table4"]
    
    
    @IBOutlet weak var enterText_TV: UITextField!
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        enterText_TV.delegate = self
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == self.enterText_TV {
            textField.resignFirstResponder()
        }
        return true
    }
    
    @IBAction func buttonEnter(_ sender: UIButton) {
        
        arrayOfNumbers.append(enterText_TV.text!)
        
        //reload your tableView
        self.tableView.reloadData()
        
        enterText_TV.text = " "
        
    }
    
    public func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        
            return arrayOfNumbers.count
        
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.textLabel?.text = arrayOfNumbers[indexPath.row]
        // Configure the cell...
        
        return cell
    }
    
//    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        arrayOfNumbers = [String(indexPath.row)]
//        
//          performSegue(withIdentifier: "table", sender: self)
//        
//    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}


//
//  AnimationTableViewController.swift
//  TableViewCellSwift
//
//  Created by anki on 4/21/17.
//  Copyright © 2017 IOS. All rights reserved.
//

import UIKit

class AnimationTableViewController: UITableViewController {
    
    var ary = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func refresh(_ sender: AnyObject) {
        
        ary.removeAll()
        tableView.reloadData()
        insertRowsMode3()
        
    }
    func insertRowsMode2() {
        
        insertRowMode2(ind: 0, str: "Level 1")
        insertRowMode2(ind: 1, str: "Level 2")
        insertRowMode2(ind: 2, str: "Level 3")
        insertRowMode2(ind: 3, str: "Level 4")
        insertRowMode2(ind: 4, str: "Level 5")
        insertRowMode2(ind: 5, str: "Level 6")
        insertRowMode2(ind: 6, str: "Level 7")
        insertRowMode2(ind: 7, str: "Level 8")
        insertRowMode2(ind: 8, str: "Level 9")
        insertRowMode2(ind: 9, str: "Level 10")
        insertRowMode2(ind: 10, str: "Level 11")
        
    }
    
    func  insertRowMode2(ind:Int, str:String) {
        
        let indPath = IndexPath(row:ind, section:0)
        ary.append(str)
        tableView.insertRows(at: [indPath], with: .right)
        
    }
    
    func insertRowsMode3() {
        
        insertRowMode3(ind: 0, str: "Level 1") {
            self.insertRowMode3(ind: 1, str: "Level 2", comp: {
                self.insertRowMode3(ind: 2, str: "Level 3", comp: {
                    self.insertRowMode3(ind: 3, str: "Level 4", comp: {
                        self.insertRowMode3(ind: 4, str: "Level 5", comp: {
                            self.insertRowMode3(ind: 5, str: "Level 6", comp: {
                                self.insertRowMode3(ind: 6, str: "Level 7", comp: {
                                    self.insertRowMode3(ind: 7, str: "Level 8", comp: {
                                        self.insertRowMode3(ind: 8, str: "Level 9", comp: {
                                            self.insertRowMode3(ind: 9, str: "Level 10", comp: {
                                                self.insertRowMode3(ind: 10, str: "Level 11", comp: {
                                                    print("every row is inserted")
                                                })
                                            })
                                        })
                                    })
                                })
                            })
                        })
                    })
                })
            })
        }
        
    }
    
    func  insertRowMode3(ind:Int, str:String, comp:@escaping() -> Void) {
        
        let indPath = IndexPath(row:ind, section:0)
        ary.append(str)
        tableView.insertRows(at: [indPath], with: .right)
        
        DispatchQueue.main.asyncAfter(deadline: .now()+0.01){
            comp()
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        insertRowsMode2()
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return ary.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! AnimatedTableViewCell
        
        cell.labelAnimated.text = ary[indexPath.row]
        
        // Configure the cell...
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

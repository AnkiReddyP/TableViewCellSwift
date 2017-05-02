//
//  SecondViewController.swift
//  TableViewCellSwift
//
//  Created by anki on 4/15/17.
//  Copyright © 2017 IOS. All rights reserved.
//

import UIKit

var pets = ["Animals","Animals1","Animals2","Cock","Dog","DogMen","Dogs","Dogs1","Elephant","Lion","Parroat","Rabbit","ColourImage","Banana","Camel","CockBirds","Eagle","Fish","Horse","Leaf","Leafs","Nature","Nature1","PenGuin","PolarBear","Rat","Tree","WhiteCat"]
var petDesc = ["Animals are discus about our self","Animals are waiting for our friend","Animals are planing Tour","Cock woke up at 5;o Clock","Dog staying to home","Dog are discuss about Owner","Dogs are Loving","Dogs are going Run","Elephants are going waterfall","Lion is waiting for Man","Parroat is singing a Song","Rabbit is thinking about our mother","Colorful image in Nature","Eating Every One","Going to Forest","Both are very Cute","Is flying Top","Is swiming","Is Running","Is very Cute","Beatiful Nature","She is Lying","Is Very Cute","Is staying in only iceland","Is eating small birds","Is giving life for Peoples","Is so Cute","Naturel life"]
var myIndex = 0

class SecondViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    public func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        print("pets is : \(pets.count)")
        return (pets.count)
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! SecondCustomTableViewCell
        
        cell.myImage.image = UIImage(named: (pets[indexPath.row] + ".jpg"))
        cell.label_TVC.text = pets[indexPath.row]
        
        // cell.backgroundColor = UIColor.blue
        
        return (cell)
    }
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        myIndex = indexPath.row
        
        performSegue(withIdentifier: "imagetable", sender: self)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

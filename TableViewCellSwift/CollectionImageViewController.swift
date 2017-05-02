//
//  CollectionImageViewController.swift
//  TableViewCellSwift
//
//  Created by anki on 4/16/17.
//  Copyright © 2017 IOS. All rights reserved.
//

import UIKit

class CollectionImageViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    @IBOutlet weak var collectionView1: UICollectionView!
    
    var collectionImages =  ["ColourImage","Banana","Camel","CockBirds","Eagle","Fish","Horse","Leaf","Leafs","Nature","Nature1","PenGuin","PolarBear","Rat","Tree","WhiteCat","Animals","Animals1","Animals2","Cock","Dog","DogMen","Dogs","Dogs1","Elephant","Lion","Parroat","Rabbit"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView1.delegate = self
        collectionView1.dataSource = self
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CustomCollectionViewCell
        
        cell.layer.cornerRadius = 50
        cell.layer.borderColor = UIColor.lightGray.cgColor
        cell.layer.borderWidth = 3
        cell.myImage.image = UIImage(named: collectionImages[indexPath.row])
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return collectionImages.count
    
    }
    
//    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//       
//      performSegue(withIdentifier: "collectionView", sender: self)
//        
//    }
    
   }

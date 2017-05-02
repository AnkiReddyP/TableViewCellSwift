//
//  MapSpeedViewController.swift
//  TableViewCellSwift
//
//  Created by anki on 4/17/17.
//  Copyright © 2017 IOS. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class MapSpeedViewController: UIViewController, CLLocationManagerDelegate {
    
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var statusLabel: UILabel!
    
    let manager = CLLocationManager()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyBest
        manager.requestWhenInUseAuthorization()
        manager.startUpdatingLocation()
        
        // Do any additional setup after loading the view.
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let location = locations[0]
        let span = MKCoordinateSpanMake(0.03, 0.03)
        let myLocation = CLLocationCoordinate2DMake(location.coordinate.latitude, location.coordinate.longitude)
        let region = MKCoordinateRegionMake(myLocation, span)
        mapView.setRegion(region, animated: true)
        
//        mapView.isZoomEnabled = true
//        self.mapView.showAnnotations(self.mapView.annotations, animated: true)
        
        
        self.mapView.showsUserLocation = true
        statusLabel.text = "\(location.speed)"
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

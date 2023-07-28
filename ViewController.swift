//
//  ViewController.swift
//  ClassDemo6
//
//  Created by Taher Haji on 7/20/22.
//

import UIKit
import MapKit

class ViewController: UIViewController, MKMapViewDelegate {

    @IBOutlet weak var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        mapView.delegate = self
        mapView.showsUserLocation = true
    }


    @IBAction func zoomIn(_ sender: Any) {
        let userLocation = mapView.userLocation
        
        let center = userLocation.location!.coordinate //puts user at center of map
        let NSdistance = 1000.0 //meters
        let EWdistance = 1000.0 //meters
        
        let region = MKCoordinateRegion(center: center, latitudinalMeters: NSdistance, longitudinalMeters: EWdistance)
        
        //commit region
        mapView.setRegion(region, animated: true)
    }
    @IBAction func changeMapType(_ sender: Any) {
        switch mapView.mapType {
        case .standard:
            mapView.mapType = .satellite
        case .satellite:
            mapView.mapType = .hybrid
        case .hybrid:
            mapView.mapType = .standard
        default:
            print("This shouldn't happen")
        }
    }
    
}


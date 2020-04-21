//
//  GPSVC.swift
//  NoahStifflerGPS
//
//  Created by Noah Stiffler on 4/1/20.
//  Copyright © 2020 Noah Stiffler. All rights reserved.
//

import UIKit
import CoreLocation

class GPSVC: UIViewController, CLLocationManagerDelegate {
    
    let locMan: CLLocationManager = CLLocationManager()
    var userLocation: CLLocation!
   
    var finalMet = ""
    var finalImp = ""
    
    
    @IBOutlet weak var distanceLabel: UILabel!
    
    @IBOutlet weak var controlOutlet: UISegmentedControl!
    
    @IBAction func controlAction(_ sender: Any) {
        switch controlOutlet.selectedSegmentIndex {
            
        case 0:
            distanceLabel.text=(String(finalMet)) + " Kilometers"
            
        case 1:
            distanceLabel.text=(String(finalImp)) + " Miles"
            
        default:
            break
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]){
        
        let newLocation: CLLocation = locations[0]
       // NSLog("Something is happening")
    
        if newLocation.horizontalAccuracy >= 0 {
            let apple:CLLocation = CLLocation(latitude: 37.334853, longitude: -122.009081)
            let diff:CLLocationDistance = apple.distance(from: newLocation)
            
            if diff < 1 {
                locMan.stopUpdatingLocation()
                distanceLabel.text = "You have arrived at the Worlds Largest Toilet™"
            }
            else {
                let commaDelimited: NumberFormatter = NumberFormatter()
                commaDelimited.numberStyle = NumberFormatter.Style.decimal
                
                distanceLabel.text=commaDelimited.string(from: NSNumber(value: (diff/1000)))! + " Kilometers"
                
                finalMet = commaDelimited.string(from: NSNumber(value: (diff/1000)))!
                    
              //  finalImp = diff/1609
                finalImp = commaDelimited.string(from: NSNumber(value: (diff/1609)))!
                }
                    
            }
            
        }
    override func viewDidLoad() {
        super.viewDidLoad()
        locMan.delegate = self
        locMan.desiredAccuracy = kCLLocationAccuracyHundredMeters
        locMan.requestWhenInUseAuthorization()
        locMan.startUpdatingLocation()
        userLocation = nil
        
    }

}

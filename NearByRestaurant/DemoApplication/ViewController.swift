//
//  ViewController.swift
//  DemoApplication
//
//  Created by Divs Art on 1/25/18.
//  Copyright © 2018 VirtualHeight It Services PVT LTD. All rights reserved.
//

import UIKit
import GoogleMaps
import GooglePlaces
import CoreLocation
import Alamofire
import KVNProgress


class ViewController: UIViewController,CLLocationManagerDelegate,GMSMapViewDelegate {

    @IBOutlet weak var map: GMSMapView!
    var Camera:GMSCameraPosition!
    var langitute:CLLocationDegrees!
    var longitute:CLLocationDegrees!
    var i = 0
    
    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.isNavigationBarHidden = true

        
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.startUpdatingLocation()

        self.startLocation()

        let location = CLLocationCoordinate2D()
        print(location.latitude)
        print(location.longitude)
        
       // Camera = GMSCameraPosition.camera(withLatitude: 37.7869, longitude: -122.4, zoom: 15.0)
       // map.camera = Camera

        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewWillAppear(_ animated: Bool)
    {
        self.navigationController?.isNavigationBarHidden = true

    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func startLocation()
    {
        if CLLocationManager.authorizationStatus() == .authorizedAlways {
            print("authorize")
            locationManager.startUpdatingLocation()
        }
        else
        {
            locationManager.requestAlwaysAuthorization()
            print("not Authorize")
        }
    }
    func findall()
    {
        if GlobalData.isConnectedToInternet() {
            //Passing input parameter
            
            //Calling Sign Up Webservice from ServiceManager
            
            
            print(langitute)
            print(longitute)
            let token = "Bearer 1i8MPAzTGF8JgL_6uuATb2pYuxcROqBrRz1aNpr_X_3cUVbSrWIbWyukArF4_il0_KU4pWk-x31Dz7MFph_y-nJBU-cXZ4CObvN6X-JPFXBNiXmc3hoIDu9iG3RpWnYx"
            
            let redias = 40000
            
            serviceManager.sharedManager.FindAll(token: token, term: "Restaurants", Lat: Float(langitute), long: Float(longitute), redias: redias)
            {
                (responce:AnyObject?, success:Bool?) -> Void in
                
                if success == true
                {
                    
                    if responce is NSDictionary
                    {
                        print("Total:\((responce?["businesses"] as! NSArray).count)")
                        
                        for i in 0..<(responce?["businesses"] as! NSArray).count
                        {
                            self.Camera = GMSCameraPosition.camera(withLatitude: self.langitute, longitude: self.longitute, zoom: 15.0)
                            
                            self.map.camera = self.Camera

                            let state_marker = GMSMarker()

                            let lant = ((((responce as! NSDictionary).value(forKey: "businesses") as! NSArray).object(at: i) as! NSDictionary).value(forKey: "coordinates") as! NSDictionary).value(forKey: "latitude") as! NSNumber
                            
                            let long2 = ((((responce as! NSDictionary).value(forKey: "businesses") as! NSArray).object(at: i) as! NSDictionary).value(forKey: "coordinates") as! NSDictionary).value(forKey: "longitude") as! NSNumber
                            
                            state_marker.position = CLLocationCoordinate2D(latitude: CLLocationDegrees(lant), longitude: CLLocationDegrees(long2))

                            
                            let address1 = ((((responce as! NSDictionary).value(forKey: "businesses") as! NSArray).object(at: i) as! NSDictionary).value(forKeyPath: "location.display_address") as! NSArray).object(at: 0) as! String
                            
                            let address2 = ((((responce as! NSDictionary).value(forKey: "businesses") as! NSArray).object(at: i) as! NSDictionary).value(forKeyPath: "location.display_address") as! NSArray).object(at: 1) as! String

                            
                            let fulladdress = "\(address1)/n\(address2)"
                            
                            state_marker.snippet = fulladdress

                            let name = (((responce as! NSDictionary).value(forKey: "businesses") as! NSArray).object(at: i) as! NSDictionary).value(forKey: "name") as! String
                            
                            state_marker.title = name
                            
                            state_marker.userData = (responce?["businesses"] as! NSArray).object(at: i) as! NSDictionary

                            state_marker.map = self.map

                            

                        }
                        
                    }
                    else
                    {
                        print("error")
                    }
                }
            }
        }
        else
        {
            let alert = UIAlertController().SingleButton(withMessage: noinertnet, Title: "Alert!!!")
            
            self.present(alert, animated: true, completion: nil)
            
            KVNProgress.dismiss()
            
        }
    }
    
    func mapView(_ mapView: GMSMapView, didTapAt coordinate: CLLocationCoordinate2D) {
        print(coordinate)
        
    }
    func mapView(_ mapView: GMSMapView, didTapInfoWindowOf marker: GMSMarker) {
        print(marker.userData!)
        let push = self.storyboard?.instantiateViewController(withIdentifier: "DetailVc") as! DetailVc
        
        push.detail = marker.userData!
        self.navigationController?.pushViewController(push, animated: true)
    }
    func mapView(_ mapView: GMSMapView, didDrag marker: GMSMarker) {
        print("move")
        
    }
    func mapView(_ mapView: GMSMapView, didChange position: GMSCameraPosition) {
        print("changepostiona")
        
        print(position.target.latitude)
        self.langitute = position.target.latitude
        self.longitute = position.target.longitude
        
        self.findall()
    }
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let location = locations.last
        langitute = location?.coordinate.latitude
        longitute = location?.coordinate.longitude
        
        if i == 1 {
            print("not set")
        }
        else
        {
        Camera = GMSCameraPosition.camera(withLatitude: langitute, longitude: longitute, zoom: 15.0)
        map.camera = Camera
            i = i+1
        }

        print(langitute)
        print(longitute)
    }
    
}


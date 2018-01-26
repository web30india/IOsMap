//
//  MainPageVC.swift
//  DemoApplication
//
//  Created by Divs Art on 1/25/18.
//  Copyright © 2018 VirtualHeight It Services PVT LTD. All rights reserved.
//

import UIKit
import CoreLocation

class MainPageVC: UIViewController,CLLocationManagerDelegate {
    
    let locationManager = CLLocationManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool)
    {
        self.navigationController?.isNavigationBarHidden = true

    }
    @IBAction func ActionPush(_ sender: Any) {
        if CLLocationManager.authorizationStatus() == .authorizedAlways {
            print("authorize")
            
            let push = self.storyboard?.instantiateViewController(withIdentifier: "ViewController") as! ViewController
            
            self.navigationController?.pushViewController(push, animated: true)

            locationManager.startUpdatingLocation()
        }
        else
        {
            locationManager.requestAlwaysAuthorization()
            print("not Authorize")
        }

    }
}

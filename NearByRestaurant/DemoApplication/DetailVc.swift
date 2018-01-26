//
//  DetailVc.swift
//  DemoApplication
//
//  Created by Divs Art on 1/25/18.
//  Copyright © 2018 VirtualHeight It Services PVT LTD. All rights reserved.
//

import UIKit
import SDWebImage

class DetailVc: UIViewController {

    @IBOutlet weak var lblRestaurantReview: UILabel!
    @IBOutlet weak var lblRestaurantNumber: UILabel!
    @IBOutlet weak var lblRestaurantCategory: UILabel!
    @IBOutlet weak var lblRestaurantRating: UILabel!
    @IBOutlet weak var lblRestaurantName: UILabel!
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet var ViewScroll: UIView!

    
    var detail:Any!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        print(detail)
        
        self.navigationController?.isNavigationBarHidden = false

        let imgurl = NSURL(string: (detail as! NSDictionary).value(forKey: "image_url")as! String)
        
        imgView.sd_setImage(with: imgurl as URL?, placeholderImage: #imageLiteral(resourceName: "gallery"), options: .continueInBackground, completed: nil)
        lblRestaurantName.text = (detail as! NSDictionary).value(forKey: "name")as? String
        lblRestaurantNumber.text = (detail as! NSDictionary).value(forKey: "phone")as? String
        
        lblRestaurantRating.text = String(describing: (detail as! NSDictionary).value(forKey: "rating") as! NSNumber)
        
        lblRestaurantReview.text = String(describing:(detail as! NSDictionary).value(forKey: "review_count") as! NSNumber)
        
        lblRestaurantCategory.text = (((detail as! NSDictionary).value(forKey: "categories")as? NSArray)?.object(at: 0) as! NSDictionary).value(forKey: "alias") as? String

        
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

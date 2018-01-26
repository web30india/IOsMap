//
//  alertView.swift
//  AirmedSales
//
//  Created by GadgetZone on 29/06/17.
//  Copyright © 2017 virtualheight. All rights reserved.
//

import Foundation
import UIKit
extension UIAlertController
{
    
    
    func SingleButton(withMessage:String,Title:String)->UIAlertController
    {
        let alert = UIAlertController(title: Title, message: withMessage, preferredStyle: .alert)
        let action = UIAlertAction.init(title: "OK", style: .cancel, handler: nil)
        alert.addAction(action)
        return alert
    }

    
    func customeInit(Title:String,withMessage:String,button:String,button2:String,comletionHandler:@escaping(UIAlertAction)->Void,completionHandler2:@escaping(UIAlertAction)->Void) -> UIAlertController {
    
    let alert = UIAlertController.init(title: Title, message: withMessage, preferredStyle: .alert)
    let otherAction = UIAlertAction.init(title: button, style: .default, handler:comletionHandler)
    let thirdaction = UIAlertAction.init(title: button2, style: .destructive, handler: completionHandler2)
        alert.addAction(thirdaction)
        alert.addAction(otherAction)
        return alert
    }
    
    func SingleButtonLogout(withmessage:String, Title:String, ButtonTitle:String,comletionHandler:@escaping(UIAlertAction)->Void) -> UIAlertController
    {
        let alert = UIAlertController(title: Title, message: withmessage, preferredStyle: .alert)
        let action = UIAlertAction.init(title: ButtonTitle, style: .default, handler: comletionHandler)
        alert.addAction(action)
        return alert

    }
    
    func Connectionlost(completionHendler:@escaping(UIAlertAction)->Void,completionHendler2:@escaping(UIAlertAction)->Void) -> UIAlertController {
        let alert = UIAlertController.init(title: appTitle, message: "Some thing Wrong", preferredStyle: .alert)
        
        let action1 = UIAlertAction.init(title: "SETTING", style: .default, handler: completionHendler)
        let action2 = UIAlertAction.init(title: "RELOAD", style: .default, handler: completionHendler2)
        
        alert.addAction(action1)
        alert.addAction(action2)
        return alert
    }


}

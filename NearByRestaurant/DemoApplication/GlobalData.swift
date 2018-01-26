//
//  GlobalData.swift
//  airrmed.pathlabs
//
//  Created by Utsav on 08/04/17.
//  Copyright © 2017 Utsav. All rights reserved.
//

import Foundation
import ReachabilitySwift
import SCLAlertView
import Alamofire

typealias responseHandler = (AnyObject? , Bool?) -> Void

class GlobalData
{
    class var sharedInstance: GlobalData
    {
        struct Singleton {
            
            static let instance = GlobalData()
        }
        return Singleton.instance
    }
    
    var isNetworkReachable = true
    
        // MARK: - INTERNET CHECK
    class func checkInternet() -> Bool
    {
        return GlobalData.sharedInstance.isNetworkReachable
    }
    // MARK: - Alert Messages
    class func displayNoInternetMessage()
    {
        SCLAlertView().showWarning(AppName, subTitle: INTERNET_UNAVAILABLE)
    }
    
    
    
    class func isConnectedToInternet() ->Bool {
        return NetworkReachabilityManager()!.isReachable
    }
    
    
    
    
}

//
//  ServieManager.swift
//  AirmedSales
//
//  Created by GadgetZone on 24/06/17.
//  Copyright © 2017 virtualheight. All rights reserved.
//

import Foundation
import Alamofire
import KVNProgress
import UIKit

class serviceManager
{
    // MARK: - SHARED MANAGER
    class var sharedManager: serviceManager
    {
        struct Singleton
        {
            static let instance = serviceManager()
        }
        return Singleton.instance
    }
    var manager:SessionManager!
    
    init() {
        
        let config = URLSessionConfiguration.default
        config.requestCachePolicy = .reloadIgnoringLocalAndRemoteCacheData
        config.urlCache = nil
        
        manager = Alamofire.SessionManager(configuration: config)
    }
    
    
    //MARK: - getting API
    func getApi(api:API)->String
    {
        print("ComplateUrl:-\(API.BaseUrl.rawValue+api.rawValue)")
        return API.BaseUrl.rawValue + api.rawValue
        
    }
    
    //MARK: - FindAll

    func FindAll(token:String,term:String,Lat:Float,long:Float,redias:Int,completionHandler:responseHandler!)
        {
        
            let strParams: String = "&term=\(term)&latitude=\(Lat)&longitude=\(long)&radius=\(redias)"
            
            let CompleteURL: String = API.BaseUrl.rawValue+API.findall.rawValue+strParams
            
            print("Login URL :\(CompleteURL)")
            
            var request = URLRequest(url: URL(string: CompleteURL)!)
            
            request.httpMethod = HTTPMethod.get.rawValue
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            request.setValue("application/json", forHTTPHeaderField: "accept")
            request.setValue(token, forHTTPHeaderField: "Authorization")
                    
            Alamofire.request(request).responseJSON { (response) in
                print(response)
                
                print("request \(String(describing: response.request))")
                print("responce \(String(describing: response.response))")
                print("error \(String(describing: response.error))")
                
                
                if let JSON = response.result.value
                {
                    completionHandler(JSON as AnyObject, true)
                }
                else
                {
                    completionHandler(nil, false)
                    
                }
            }
    
    }
    
}

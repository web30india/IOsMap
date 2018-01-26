//
//  Constants.swift
//  AirmedSales
//
//  Created by GadgetZone on 24/06/17.
//  Copyright © 2017 virtualheight. All rights reserved.
//

import Foundation
import SCLAlertView
import UIKit

// MARK: -
////////////////////////////////////////////////////////////////////////
////////////////////////// DEVICE TYPE MACROS //////////////////////////
////////////////////////////////////////////////////////////////////////
var IS_IPAD = (UI_USER_INTERFACE_IDIOM() == .pad)
var IS_IPHONE = (UI_USER_INTERFACE_IDIOM() == .phone)
var IS_RETINA = (UIScreen.main.scale >= 2.0)

var INTERNET_UNAVAILABLE = "NoInternetavailable"

var AppName:String = "AppName"

 let NAV_BG_COLOR = UIColor(red: 143/255, green: 210/255, blue: 45/255, alpha: 1)


var noinertnet = "NoInternetavailable"
var appTitle = "AppName"
var Error  = "Error!!!"


//MARK:- API
enum API:String
{
//Live
    

    case BaseUrl = "https://api.yelp.com/v3/"
 
    case findall           = "businesses/search?"
}

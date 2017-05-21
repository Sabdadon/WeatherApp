//
//  Location.swift
//  weatherApp
//
//  Created by sabarish sridhar on 21/05/17.
//  Copyright © 2017 sabarish. All rights reserved.
//

import CoreLocation
class Location{
static var sharedInstance = Location()
    private init(){}
    var latitude : Double!
    var longitude : Double!
}

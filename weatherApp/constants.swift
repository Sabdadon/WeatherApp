//
//  constants.swift
//  weatherApp
//
//  Created by sabarish sridhar on 19/05/17.
//  Copyright © 2017 sabarish. All rights reserved.
//

import Foundation
let BASE_URL = "http://api.openweathermap.org/data/2.5/weather?"
let LATITUDE = "lat="
let LONGITUDE = "&lon="
let APPID = "&appid="
let APIKEY = "243f6117cfb66470c1b92b091d8bff82"
let CURRENT_WEATHER_URL = "\(BASE_URL)\(LATITUDE)20\(LONGITUDE)100\(APPID)\(APIKEY)"
typealias DownloadComplete = () -> ()

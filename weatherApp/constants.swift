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
let CURRENT_WEATHER_URL = "\(BASE_URL)\(LATITUDE)12.9754\(LONGITUDE)80.1901\(APPID)\(APIKEY)"
typealias DownloadComplete = () -> ()

 let FORECAST_URL = "http://api.openweathermap.org/data/2.5/forecast/daily?lat=12.9754&lon=80.1901&cnt=10&appid=243f6117cfb66470c1b92b091d8bff82"

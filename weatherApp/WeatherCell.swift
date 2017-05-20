//
//  WeatherCell.swift
//  weatherApp
//
//  Created by sabarish sridhar on 20/05/17.
//  Copyright © 2017 sabarish. All rights reserved.
//

import UIKit

class WeatherCell: UITableViewCell {

    @IBOutlet weak var weatherIcon: UIImageView!
  
    @IBOutlet weak var dayLbl: UILabel!
    @IBOutlet weak var weatherType: UILabel!

    @IBOutlet weak var lowTempLbl: UILabel!
    @IBOutlet weak var highTemp: UILabel!
    
    
    func configureCell(forecast:Forecast)
    {
    lowTempLbl.text = "\(forecast.lowTemp)"
    highTemp.text = "\(forecast.highTemp)"
    weatherType.text = forecast.weatherType
    dayLbl.text = forecast.date
        weatherIcon.image = UIImage(named: forecast.weatherType)
    }
}

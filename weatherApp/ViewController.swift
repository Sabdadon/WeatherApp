//
//  ViewController.swift
//  weatherApp
//
//  Created by sabarish sridhar on 19/05/17.
//  Copyright © 2017 sabarish. All rights reserved.
//

import UIKit
import CoreLocation
import Alamofire
class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate,CLLocationManagerDelegate{
 
    var CurrentWeather :currentWeather!
    var forecast :Forecast!
    var forecasts = [Forecast]()
    @IBOutlet weak var datelbl: UILabel!
    
    @IBOutlet weak var InfoView: UITableView!
    @IBOutlet weak var currentWeatherType: UILabel!
    @IBOutlet weak var currentWeatherImg: UIImageView!
    @IBOutlet weak var cityLbl: UILabel!
    @IBOutlet weak var currentTempLbl: UILabel!
    
    let locationManager = CLLocationManager()
    var currentLocation : CLLocation!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        InfoView.dataSource = self
        InfoView.delegate = self
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startMonitoringSignificantLocationChanges()
        
        CurrentWeather = currentWeather()

        

    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        super.viewDidAppear(animated)
        locationAuthStatus()
        
        
    }
    
    func downloadForecastData(completed : @escaping DownloadComplete)
    {
     let forecastURL = URL(string:FORECAST_URL)!
        Alamofire.request(forecastURL).responseJSON { response in
        let result = response.result
            if let dict = result.value as? Dictionary<String,AnyObject>
            {
            if let list = dict["list"] as? [Dictionary<String,AnyObject>]
            {
                for obj in list
                {
                    let forecast = Forecast(weatherDict :obj)
                    self.forecasts.append(forecast)
                    print(obj)
                }
             self.InfoView.reloadData()
             self.forecasts.remove(at: 0)
                }
            
            }
            completed()
        
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
            }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return forecasts.count-1
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "weatherCell", for: indexPath) as? WeatherCell{
        
              let forecast = forecasts[indexPath.row]
            cell.configureCell(forecast:forecast)
            return cell
        }
        
        else{
        return WeatherCell()
    }
    }
    
    
    func locationAuthStatus()
    {
    
        if CLLocationManager.authorizationStatus() == .authorizedWhenInUse
        {
        
        currentLocation = locationManager.location
            Location.sharedInstance.latitude = currentLocation.coordinate.latitude
            Location.sharedInstance.longitude = currentLocation.coordinate.longitude
           
            CurrentWeather.downloadWeatherDetails {
                self.downloadForecastData {
                    self.updateMainUI()
                }
                
            }

        
        }
        
        else{
        locationManager.requestWhenInUseAuthorization()
            locationAuthStatus()
        
        }
    }
    
    
    func updateMainUI()
    {
        datelbl.text = CurrentWeather.date
        
        currentTempLbl.text = "\(CurrentWeather.currentTemp)"
        print("\(CurrentWeather.currentTemp)")
        currentWeatherType.text = CurrentWeather.weatherType
        print(CurrentWeather.weatherType)
        cityLbl.text = CurrentWeather.cityName
        print(CurrentWeather.cityName)
        currentWeatherImg.image = UIImage(named:CurrentWeather.weatherType)
        
    
    }

}


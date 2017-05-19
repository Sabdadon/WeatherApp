//
//  ViewController.swift
//  weatherApp
//
//  Created by sabarish sridhar on 19/05/17.
//  Copyright © 2017 sabarish. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate{

    var CurrentWeather :currentWeather!
    
    @IBOutlet weak var datelbl: UILabel!
    
    @IBOutlet weak var InfoView: UITableView!
    @IBOutlet weak var currentWeatherType: UILabel!
    @IBOutlet weak var currentWeatherImg: UIImageView!
    @IBOutlet weak var cityLbl: UILabel!
    @IBOutlet weak var currentTempLbl: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        InfoView.dataSource = self
        InfoView.delegate = self
        CurrentWeather = currentWeather()
        CurrentWeather.downloadWeatherDetails {
           self.updateMainUI()
        }
       

    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
            }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "weatherCell", for: indexPath)
        return cell
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


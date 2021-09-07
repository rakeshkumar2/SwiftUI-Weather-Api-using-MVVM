//
//  LocationDataModel.swift
//  WeatherApp (iOS)
//
//  Created by zapbuild on 07/09/21.
//

import Foundation

struct LocationData: Decodable {
    var location:Location = Location()
    var current:CurrentWeatherData = CurrentWeatherData()
    
}

struct CurrentWeatherData: Decodable {
    var temp_f: Double = 0.0
    var pressure_in: Double = 0.0
    var cloud: Int = 0
}

struct Location: Decodable {
    var region: String = ""
}


//
//  WeatherViewModel.swift
//  WeatherApp (iOS)
//
//  Created by zapbuild on 07/09/21.
//

import Foundation
import SwiftUI

class WeatherViewModel: ObservableObject{
    @Published var weatherData = LocationData()
    
    func getWeatherData(){
        let session = URLSession.shared
        let url = URL(string: Constant.weatherApiRequestUrl)
        session.dataTask(with: url!) { data, res, error in
            //Now parse data from Data
            guard let data = data else{return}
            do{
                let locationDataModel = try JSONDecoder().decode(LocationData.self, from: data)
                //Dispatch is used becuase it will update UI
                DispatchQueue.main.async {
                    self.weatherData = locationDataModel
                }
                
                print(locationDataModel)
            }catch{
                print(error.localizedDescription)
            }
        }.resume()
        
        //Data parsing giving problem thats why catch is called
    }
}

//now we have weather data now need to add on UI

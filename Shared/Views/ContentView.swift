//
//  ContentView.swift
//  Shared
//
//  Created by zapbuild on 07/09/21.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var weatherViewModel = WeatherViewModel()
    var body: some View {
        VStack{
            Text("Region: ").bold() + Text(weatherViewModel.weatherData.location.region)
            
            Text("Temperature: ").bold() + Text("\(weatherViewModel.weatherData.current.temp_f)C")
            
            Text("Pressure: ").bold() + Text("\(weatherViewModel.weatherData.current.pressure_in)")
            
            Text("Clouds available: ").bold() + Text(weatherViewModel.weatherData.current.cloud == 1 ? "YES" : "NO")
            
            Button(action: {
                // Click on this button we will call api in view model
                self.weatherViewModel.getWeatherData()
            }, label: {
                Text("Load Data")
                    .padding()
                    .background(Color.green)
                    .foregroundColor(Color.white)
                    .cornerRadius(12)
            })
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

//As you can see first it is loading default data on UI. When load data clicked api data is autmatically updated. It is pure concept of MVVM.

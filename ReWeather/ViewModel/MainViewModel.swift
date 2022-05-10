//
//  MainViewModel.swift
//  ReWeather
//
//  Created by cmStudent on 2022/05/10.
//

import Foundation

class WeatherViewModel: ObservableObject {
    var place = "Numazu"
    @Published var fiveDayData: FiveDayData?
    @Published var weatherData: WeatherData?
    @Published var toggle = false
    
    func getWeather() {
        let API = "https://api.openweathermap.org/data/2.5/weather"
        JSONConverter.resume(API: API, place: place) {data, response, error in
            
            // dataがあるかどうか?あれば使う。
            guard let data = data else { return }
            
            do {
                let decoder = JSONDecoder()
                // 受け取ったJSONデータをパースして格納
                let weather = try decoder.decode(OpenWeather.self, from: data)
                print("パースできます")
                print(weather)
                
                let temp = weather.main.temp
                let feels_like = weather.main.feels_like
                let temp_min = weather.main.temp_min
                let temp_max = weather.main.temp_max
                let humidity = weather.main.humidity
                let description  = weather.weather[0].description
                let icon = weather.weather[0].icon
                let name = weather.name
                
                self.weatherData = WeatherData(temp: temp, feels_like: feels_like, temp_min: temp_min, temp_max: temp_max, humidity: humidity, description: description, icon: icon, name: name)
                
            } catch let error {
                
                print(error)
                print("パースに失敗しました")
                
            }
        }
        
    }
    
    func getFiveDayWeather() {
        let API = "https://api.openweathermap.org/data/2.5/forecast"
        JSONConverter.resume(API: API, place: place) {data, response, error in
            
            // dataがあるかどうか?あれば使う。
            guard let data = data else { return }
            
            do {
                let decoder = JSONDecoder()
                // 受け取ったJSONデータをパースして格納
                let weather = try decoder.decode(FiveDayWeather.self, from: data)
                print("パースできます")
                print(weather)
                
                DispatchQueue.main.async {
                    var lists: [ListData] = []
                    
                    for weathers in weather.list {
                        let dt_txt = self.getDate(dateString: weathers.dt_txt)
                        let day = self.getDay(date: dt_txt, format: "MM/dd")
                        let hour = self.getDay(date: dt_txt, format: "HH:00")
                        let temp = weathers.main.temp
                        let feels_like = weathers.main.feels_like
                        let temp_min = weathers.main.temp_min
                        let temp_max = weathers.main.temp_max
                        let humidity = weathers.main.humidity
                        let description  = weathers.weather[0].description
                        let icon = weathers.weather[0].icon
                        let list = ListData(day: day,hour: hour,
                                            temp: temp,feels_like: feels_like,
                                            temp_min: temp_min,temp_max: temp_max,
                                            humidity: humidity,
                                            description: description,
                                            icon: icon)
                        lists.append(list)
                        
                    }
                    
                    self.fiveDayData = FiveDayData(list: lists)
                    self.toggle = true
                    
                }
                
            } catch let error {
                
                print(error)
                print("パースに失敗しました")
                
            }
            
        }
    }
    
    /// String型をDate型に変換する
    func getDate(dateString: String) -> Date {
        let formatter: DateFormatter = DateFormatter()
        formatter.calendar = Calendar(identifier: .gregorian)
        formatter.dateFormat = "yyyy/MM/dd HH:mm:ss"
        return formatter.date(from: dateString)!
        
    }
    /// Date型をString型に変換する
    func getDay(date: Date, format: String) -> String {
        let formatter: DateFormatter = DateFormatter()
        formatter.calendar = Calendar(identifier: .gregorian)
        formatter.dateFormat = format
        return formatter.string(from: date)
    }
}

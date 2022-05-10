//
//  OpenWeather.swift
//  ReWeather
//
//  Created by cmStudent on 2022/05/10.
//

import Foundation

struct OpenWeather: Decodable {
    
    let main: MainWeather
    let weather: [Weather]
    /// 地域
    let name: String
    
}

struct FiveDayWeather: Decodable {

    let list: [WeatherList]
    
}

struct WeatherList: Decodable {
    
    let main: MainWeather
    let weather: [Weather]
    /// 日時
    let dt_txt: String
    
}

/// 温度、湿度など
struct MainWeather: Decodable {
    /// 温度
    let temp: Double
    /// 体感温度
    let feels_like: Double
    /// 最低気温
    let temp_min: Double
    /// 最高気温
    let temp_max: Double
    /// 湿度
    let humidity: Int
}

/// 天候とアイコン
struct Weather: Decodable {
    /// 天候
    let description: String
    /// アイコン
    let icon: String
}


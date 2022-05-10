//
//  FiveDayData.swift
//  ReWeather
//
//  Created by cmStudent on 2022/05/10.
//

import Foundation

struct FiveDayData: Decodable {
    let list: [ListData]
}

struct ListData: Decodable {
    /// 日時
    let day: String
    let hour: String
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
    /// 天候
    let description: String
    /// アイコン
    let icon: String
    
}

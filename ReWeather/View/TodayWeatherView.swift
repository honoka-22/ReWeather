//
//  TodayWeatherView.swift
//  ReWeather
//
//  Created by cmStudent on 2022/05/10.
//

import SwiftUI

struct TodayWeatherView: View {
    var weather: WeatherData?
    
    var body: some View {
        HStack {
            Image(weather?.icon ?? "noImage")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 100, height: 100)
            VStack {
                Text(weather?.name ?? "日本")
                Text(weather?.description ?? "不明")
                    .font(.title)
            }
        }
    }
}

struct TodayWeatherView_Previews: PreviewProvider {
    static var previews: some View {
        TodayWeatherView()
    }
}

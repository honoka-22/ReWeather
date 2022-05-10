//
//  MainView.swift
//  ReWeather
//
//  Created by cmStudent on 2022/05/10.
//

import SwiftUI

struct MainView: View {
    @ObservedObject var viewModel = WeatherViewModel()
    /// 画面の横幅÷2 = 中心の位置
    let halfScreenWidth = UIScreen.main.bounds.width / 2
    /// 拡大倍率
    let magnification: CGFloat = 1.5
    init() {
        viewModel.getWeather()
        viewModel.getFiveDayWeather()
    }
    
    var body: some View {
        ZStack {
            Color("BGColor")
                .edgesIgnoringSafeArea(.all)
            VStack {
                Text("今日の天気")
                TodayWeatherView(weather: viewModel.weatherData)
                
                Text("5日間の天気")
                Spacer()
                
                if viewModel.toggle {
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack {
                            fiveDayWeather
                        }
                    }
                    
                }
            }
        }
        
    }
    
    var fiveDayWeather: some View {
        
        ForEach(0 ..< (viewModel.fiveDayData?.list.count)!) { num in
            GeometryReader { geometry in
                WeatherCell(list: viewModel.fiveDayData?.list[num])     .scaleEffect(max(0.8,-abs(geometry.frame(in: .global).midX - self.halfScreenWidth) / self.halfScreenWidth * self.magnification + self.magnification))
                
            }
            .frame(width: 100)
            .padding()
        }
        
        
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}

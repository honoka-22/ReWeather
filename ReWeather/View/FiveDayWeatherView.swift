//
//  FiveDayWeatherView.swift
//  ReWeather
//
//  Created by cmStudent on 2022/05/10.
//

import SwiftUI

struct FiveDayWeatherView: View {
    @ObservedObject var viewModel = WeatherViewModel()
    /// 画面の横幅÷2
    let halfScreenWidth = UIScreen.main.bounds.width / 2
    /// 拡大倍率
    let magnification: CGFloat = 1.8
    var dataCount : Int    
    var body: some View {
        HStack {
            ForEach(0 ..< dataCount) { num in
                GeometryReader { geometry in
                    WeatherCell(list: viewModel.fiveDayData?.list[num])
                        .scaleEffect(max(0.8,-abs(geometry.frame(in: .global).midX - self.halfScreenWidth) / self.halfScreenWidth * self.magnification + self.magnification), anchor: .bottom)
                    
                }
                
                .frame(width: 100)
                .padding()
            }
        }
        
    }
}

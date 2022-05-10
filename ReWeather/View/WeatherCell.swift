//
//  WeatherCell.swift
//  ReWeather
//
//  Created by cmStudent on 2022/05/10.
//

import SwiftUI

struct WeatherCell: View {
    var list: ListData?
    
    var body: some View {
        VStack {
            Text(list?.day ?? "")
            Text(list?.hour ?? "")
            Image(list?.icon ?? "noImage")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 50, height: 50)
            Text(list?.description ?? "")
            
        }.padding(10)
    }
}

struct WeatherCell_Previews: PreviewProvider {
    static var previews: some View {
        WeatherCell()
    }
}

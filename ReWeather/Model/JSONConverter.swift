//
//  JSONConverter.swift
//  ReWeather
//
//  Created by cmStudent on 2022/05/10.
//

import Foundation

class JSONConverter {
    
    static func resume(API: String, place: String,
                       handler: @escaping (Data?, URLResponse?, Error?) -> ()) {
        
        let APP_ID = "1234fa0b60c9593ef36e6889e313be22"
        
        guard let url = URL(string: API) else {
            print("URLに変換できませんでした")
            return
        }
        
        // URLにクエリストリングを追加
        var components = URLComponents(url: url, resolvingAgainstBaseURL: true)!
        components.queryItems = [URLQueryItem(name: "appid", value: APP_ID),
                                 URLQueryItem(name: "q", value: place),
                                 URLQueryItem(name: "lang", value: "ja"),
                                 URLQueryItem(name: "units", value: "metric")]
        
        print(components.url!)
        
        // リクエストに必要な情報を生成
        let request = URLRequest(url: components.url!)
        // リクエストをタスクとして登録
        let task = URLSession.shared
            .dataTask(with: request, completionHandler: handler)
        print("リクエストをタスクとして登録しました")
        // ダウンロード開始
        task.resume()
        
    }
}

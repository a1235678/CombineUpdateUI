//
//  NetworkManager.swift
//  CombineCollectionView
//
//  Created by zeroplus on 2020/5/7.
//  Copyright © 2020 zeroplus. All rights reserved.
//

import Foundation
import UIKit
import Combine

class NetworkManager {
    static func fetchTopMovies() -> AnyPublisher<MovieData, Error> {
        let decoder = JSONDecoder()
        let url = URL(string: "https://rss.itunes.apple.com/api/v1/tw/movies/top-movies/all/100/explicit.json")!
        
        return URLSession.shared.dataTaskPublisher(for: url)
            .map {$0.data}
            .decode(type: MovieData.self, decoder: decoder)
            .eraseToAnyPublisher()
    }
    
    static func fetchImage(url: URL) -> AnyPublisher<UIImage?, URLError> {
        // fetchImage using dataTaskPublisher
        return URLSession.shared.dataTaskPublisher(for: url)
            .map { result in
                    return UIImage(data: result.data)
                 }
            .eraseToAnyPublisher();
    }
}





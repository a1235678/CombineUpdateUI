//
//  Feeds.swift
//  CombineCollectionView
//
//  Created by zeroplus on 2020/5/7.
//  Copyright © 2020 zeroplus. All rights reserved.
//

import Foundation

struct Feed: Codable, Hashable {
    var name: String
    var artworkUrl100: URL
    var id: String
}

struct Feeds: Codable {
    var results: [Feed]
}

struct MovieData: Codable {
    var feed: Feeds
}

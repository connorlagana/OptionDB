//
//  News.swift
//  OptionDB
//
//  Created by Connor Lagana on 8/12/19.
//  Copyright © 2019 Connor Lagana. All rights reserved.
//

import Foundation

struct News: Decodable {
    let articles: [Article]
}

struct Article: Decodable {
    let source: Source
    let title: String
    let url: URL
    let urlToImage: String
}

struct Source: Decodable {
    let name: String
}

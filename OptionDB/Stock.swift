//
//  Stock.swift
//  OptionDB
//
//  Created by Connor Lagana on 8/12/19.
//  Copyright © 2019 Connor Lagana. All rights reserved.
//

import Foundation

struct Stock: Decodable {
    let symbol: String
    let companyName: String
    let latestPrice: Float
    let change: Float?
}

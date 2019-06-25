//
//  Store.swift
//  Paygyft_simulation_test
//
//  Created by Singh, Pooja (US - Bengaluru) on 6/23/19.
//  Copyright © 2019 Singh, Pooja (US - Bengaluru). All rights reserved.
//

import Foundation

struct Store: Codable {
    
    let store_name: String
    let logo: String
    let offer: String
}

struct StoreResponse: Decodable {
    let data: [Store]
}

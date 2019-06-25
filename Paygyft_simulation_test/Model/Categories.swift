//
//  Categories.swift
//  Paygyft_simulation_test
//
//  Created by Singh, Pooja (US - Bengaluru) on 6/23/19.
//  Copyright © 2019 Singh, Pooja (US - Bengaluru). All rights reserved.
//

import Foundation

struct Categories: Codable {
    let category_slug: String
    let bcategory_name: String
    let icon: String?
}

struct CategoriesResponse: Decodable {
    let current_location: String
    let categories: [Categories]
}

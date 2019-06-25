//
//  WebService+Extension.swift
//  Paygyft_simulation_test
//
//  Created by Singh, Pooja (US - Bengaluru) on 6/23/19.
//  Copyright © 2019 Singh, Pooja (US - Bengaluru). All rights reserved.
//

import UIKit

//MARK: Webservice call
extension ViewController {
    
    func getSegments() {
        let urlString =  "https://paygyft.com/staging/api/v1/user/store/search/popular"
        guard let serviceUrl = URL(string: urlString) else { return }
        var request = URLRequest(url: serviceUrl)
        request.httpMethod = "POST"
        //Headers
        request.setValue("74c14fa62349c91c67607d8382656c431eb8e0b6-084e0343a0486ff05530df6c705c8bb4", forHTTPHeaderField: "usrtoken")
        request.setValue("12.9716", forHTTPHeaderField: "lat")
        request.setValue("77.5946", forHTTPHeaderField: "lng")
        
        let session = URLSession.shared
        session.dataTask(with: request) { (data, response, error) in
            guard let data = data else { return }
            do {
                let categoryResponse = try JSONDecoder().decode(CategoriesResponse.self, from: data)
                DispatchQueue.main.async {
                    self.configSegmentedControlWith(categories: categoryResponse.categories)
                    self.categories = categoryResponse.categories
                    // Selected index
                    self.segmentedControl.selectedSegmentIndex = 0
                }
            } catch let err {
                print("Err", err)
            }
            }.resume()
    }
    
    func getCategoryData(selectedIndex: Int) {
        
        let selectedCategory = categories[selectedIndex].category_slug
        let urlString =  "https://paygyft.com/staging/api/v1/user/store/search/\(selectedCategory)"
        guard let serviceUrl = URL(string: urlString) else { return }
        var request = URLRequest(url: serviceUrl)
        request.httpMethod = "POST"
        //Headers
        request.setValue("74c14fa62349c91c67607d8382656c431eb8e0b6-084e0343a0486ff05530df6c705c8bb4", forHTTPHeaderField: "usrtoken")
        request.setValue("12.9716", forHTTPHeaderField: "lat")
        request.setValue("77.5946", forHTTPHeaderField: "lng")
        
        let session = URLSession.shared
        session.dataTask(with: request) { (data, response, error) in
            guard let data = data else { return }
            do {
                let storeResponse = try JSONDecoder().decode(StoreResponse.self, from: data)
                DispatchQueue.main.async {
                    self.stores = storeResponse.data
                    self.collectionView.reloadData()
                }
            } catch let err {
                print("Err", err)
            }
            }.resume()
    }
    
}

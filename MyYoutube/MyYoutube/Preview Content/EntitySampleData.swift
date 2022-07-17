//
//  EntitySampleData.swift
//  MyYoutube
//
//  Created by Shuhei Shitamori on 2022/07/17.
//

import Foundation

extension SearchListResponse {
    static var sample: SearchListResponse {
        let url = Bundle.main.url(forResource: "SearchListResponse", withExtension: "json")!
        let data = try! Data(contentsOf: url)
        return try! JSONDecoder().decode(SearchListResponse.self, from: data)
    }
}

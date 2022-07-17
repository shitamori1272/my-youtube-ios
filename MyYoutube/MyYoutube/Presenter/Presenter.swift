//
//  Presenter.swift
//  MyYoutube
//
//  Created by Shuhei Shitamori on 2022/07/14.
//

import Foundation

class Presenter: ObservableObject {
    @Published var searchListResponse: SearchListResponse
    
    init(searchListResponse: SearchListResponse) {
        self.searchListResponse = searchListResponse
    }
}

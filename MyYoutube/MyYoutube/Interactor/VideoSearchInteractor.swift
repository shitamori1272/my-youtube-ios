//
//  VideoSearchInteractor.swift
//  MyYoutube
//
//  Created by Shuhei Shitamori on 2022/07/17.
//

import Foundation

class VideoSearchInteractor {
    
    private let repository: YoutubeDataAPIRequest
    
    init(repository: YoutubeDataAPIRequest = YoutubeDataAPIRequest()) {
        self.repository = repository
    }
    
    func execute(query: String) async throws -> SearchListResponse {
        try await repository.searchList(query: query)
    }
}

//
//  VideoSearchInteractor.swift
//  MyYoutube
//
//  Created by Shuhei Shitamori on 2022/07/17.
//

import Foundation

class VideoSearchInteractor: Usecase {
    
    private let repository: any Repository<YoutubeDataAPIRequest.Input, YoutubeDataAPIRequest.Output>
    
    init(repository: any Repository<YoutubeDataAPIRequest.Input, YoutubeDataAPIRequest.Output> = YoutubeDataAPIRequest()) {
        self.repository = repository
    }
    
    func execute(_ input: String) async throws -> SearchListResponse {
        try await repository.fetch(input)
    }
}

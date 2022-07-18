//
//  Presenter.swift
//  MyYoutube
//
//  Created by Shuhei Shitamori on 2022/07/14.
//

import Foundation

@MainActor
class Presenter: ObservableObject {
    
    @Published var searchListResponse: SearchListResponse
    
    private let videoSearchUsecase: VideoSearchInteractor
    
    init(searchListResponse: SearchListResponse,
         videoSearchUsecase: VideoSearchInteractor = VideoSearchInteractor()) {
        self.searchListResponse = searchListResponse
        self.videoSearchUsecase = videoSearchUsecase
    }
    
    func submitTextField(query: String) {
        Task { [weak self] in
            self?.searchListResponse = try! await videoSearchUsecase.execute(query: query)
        }
    }
}

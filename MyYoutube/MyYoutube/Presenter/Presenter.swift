//
//  Presenter.swift
//  MyYoutube
//
//  Created by Shuhei Shitamori on 2022/07/14.
//

import Foundation

@MainActor
class Presenter: ObservableObject {
    
    @Published var videoItems: [VideoItem]
    
    private let videoSearchUsecase: VideoSearchInteractor
    
    init(
        videoItems: [VideoItem] = [],
        videoSearchUsecase: VideoSearchInteractor = VideoSearchInteractor()
    ) {
        self.videoItems = videoItems
        self.videoSearchUsecase = videoSearchUsecase
    }
    
    func submitTextField(query: String) {
        Task { [weak self] in
            self?.videoItems = try! await videoSearchUsecase.execute(query: query).items
        }
    }
}

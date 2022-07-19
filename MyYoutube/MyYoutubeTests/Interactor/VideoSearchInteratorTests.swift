//
//  VideoSearchInteratorTests.swift
//  MyYoutubeTests
//
//  Created by Shuhei Shitamori on 2022/07/19.
//

import XCTest
@testable import MyYoutube

final class VideoSearchInteratorTests: XCTestCase {
    class RepositoryMock: Repository {
        func fetch(_ input: YoutubeDataAPIRequest.Input) async throws -> YoutubeDataAPIRequest.Output {
            return SearchListResponse.sample
        }
    }
    
    var repository: RepositoryMock!
    var videoSearchInteractor: VideoSearchInteractor!
    
    override func setUp() async throws {
        repository = RepositoryMock()
        videoSearchInteractor = VideoSearchInteractor(repository: repository)
    }
    
    func testReturnSearchListResponseWhenFetchSuccess() async throws {
        let output = try await videoSearchInteractor.execute("test")
        XCTAssertEqual(output, SearchListResponse.sample)
    }
}

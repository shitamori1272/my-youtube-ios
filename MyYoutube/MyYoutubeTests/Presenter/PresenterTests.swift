//
//  PresenterTests.swift
//  MyYoutubeTests
//
//  Created by Shuhei Shitamori on 2022/07/19.
//

import XCTest
@testable import MyYoutube

final class PresenterTests: XCTestCase {
    
    class UsecaseMock: Usecase {
        func execute(_ input: VideoSearchInteractor.Input) async throws -> VideoSearchInteractor.Output {
            return SearchListResponse.sample
        }
    }
    
    var usecase: UsecaseMock!
    var presenter: Presenter!
    
    override func setUp() async throws {
        usecase = UsecaseMock()
        presenter = await Presenter(videoItems: [], videoSearchUsecase: usecase)
    }
    
    @MainActor
    func testSetVideItemsWhenUsecaseReturnSearchListResponse() async throws {
        presenter.submitTextField(query: "test")
        Task {
            XCTAssertEqual(presenter.videoItems, SearchListResponse.sample.items)
        }
    }
}

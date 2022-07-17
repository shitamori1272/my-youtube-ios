//
//  MyYoutubeApp.swift
//  MyYoutube
//
//  Created by Shuhei Shitamori on 2022/07/14.
//

import SwiftUI

@main
struct MyYoutubeApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(presenter: Presenter(searchListResponse: SearchListResponse.sample))
        }
    }
}

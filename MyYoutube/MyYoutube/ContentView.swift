//
//  ContentView.swift
//  MyYoutube
//
//  Created by Shuhei Shitamori on 2022/07/14.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var presenter: Presenter
    
    var body: some View {
        VStack {
            Text(presenter.searchListResponse.regionCode)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(presenter: Presenter(searchListResponse: SearchListResponse.sample))
    }
}

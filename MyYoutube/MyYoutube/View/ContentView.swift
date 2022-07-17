//
//  ContentView.swift
//  MyYoutube
//
//  Created by Shuhei Shitamori on 2022/07/14.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var presenter: Presenter
    
    @State private var queryText: String = ""
    
    var body: some View {
        VStack {
            Text(presenter.searchListResponse.regionCode)
            TextField("example", text: $queryText)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .onSubmit {
                    presenter.submitTextField(query: queryText)
                }
                .padding()
            List(presenter.searchListResponse.items) { item in
                VideoItemRow(videoItem: item)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(presenter: Presenter(searchListResponse: SearchListResponse.sample))
    }
}

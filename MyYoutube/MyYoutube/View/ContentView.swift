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
            TextField("example", text: $queryText)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .onSubmit {
                    presenter.submitTextField(query: queryText)
                }
                .padding()
            List(presenter.videoItems) { item in
                VideoItemRow(videoItem: item)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(presenter: Presenter(videoItems: SearchListResponse.sample.items))
    }
}

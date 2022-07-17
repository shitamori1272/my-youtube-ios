//
//  VideoItemRow.swift
//  MyYoutube
//
//  Created by Shuhei Shitamori on 2022/07/17.
//

import SwiftUI

struct VideoItemRow: View {
    
    let videoItem: VideoItem
    
    var body: some View {
        Text(videoItem.snippet.title)
    }
}

struct VideoItemRow_Previews: PreviewProvider {
    
    static let item = SearchListResponse.sample.items.first!
    
    static var previews: some View {
        Group {
            VideoItemRow(videoItem: item)
                .previewLayout(.fixed(width: 375, height: 100))
        }
    }
}

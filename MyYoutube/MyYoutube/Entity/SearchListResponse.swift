//
//  SearchListResponse.swift
//  MyYoutube
//
//  Created by Shuhei Shitamori on 2022/07/14.
//

import Foundation

// MARK: - SearchListResponse
struct SearchListResponse: Codable, Equatable {
    let kind, etag, nextPageToken, regionCode: String
    let pageInfo: PageInfo
    let items: [VideoItem]
}

// MARK: - VideoItem
struct VideoItem: Codable, Identifiable, Equatable {
    let kind, etag: String
    let id: ID
    let snippet: Snippet
}

// MARK: - ID
struct ID: Codable, Hashable {
    let kind, videoID: String

    enum CodingKeys: String, CodingKey {
        case kind
        case videoID = "videoId"
    }
}

// MARK: - Snippet
struct Snippet: Codable, Equatable {
    let publishedAt: String
    let channelID, title, snippetDescription: String
    let thumbnails: Thumbnails
    let channelTitle, liveBroadcastContent: String
    let publishTime: String

    enum CodingKeys: String, CodingKey {
        case publishedAt
        case channelID = "channelId"
        case title
        case snippetDescription = "description"
        case thumbnails, channelTitle, liveBroadcastContent, publishTime
    }
}

// MARK: - Thumbnails
struct Thumbnails: Codable, Equatable {
    let thumbnailsDefault, medium, high: Default

    enum CodingKeys: String, CodingKey {
        case thumbnailsDefault = "default"
        case medium, high
    }
}

// MARK: - Default
struct Default: Codable, Equatable {
    let url: String
    let width, height: Int
}

// MARK: - PageInfo
struct PageInfo: Codable, Equatable {
    let totalResults, resultsPerPage: Int
}

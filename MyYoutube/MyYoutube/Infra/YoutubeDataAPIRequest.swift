//
//  YoutubeDataAPIRequest.swift
//  MyYoutube
//
//  Created by Shuhei Shitamori on 2022/07/17.
//

import Foundation

class YoutubeDataAPIRequest {
    
    enum APIRequstError: Error {
        case URLGenerateFailed
    }
    
    private let baseURLString = "https://www.googleapis.com/youtube/v3/search"
    
    private static var apiKey: String {
        guard let keyFilePath = Bundle.main.path(forResource: "APIKey", ofType: "plist"),
              let keyDictionary = NSDictionary(contentsOfFile: keyFilePath),
              let key = keyDictionary["YoutubeDataAPIKey"] as? String else { return "" }
        return key
    }
    
    private var params: [String: String] = [
        "key": apiKey,
        "type": "video",
        "part": "snippet"
    ]
    
    func searchList(query: String) async throws -> SearchListResponse {
        var urlComponent = URLComponents(string: baseURLString)
        params["q"] = query
        urlComponent?.queryItems = params.map { URLQueryItem(name: $0, value: $1) }
        guard let url = urlComponent?.url else { throw APIRequstError.URLGenerateFailed }
        let (data, _) = try await URLSession.shared.data(from: url)
        return try JSONDecoder().decode(SearchListResponse.self, from: data)
    }
}

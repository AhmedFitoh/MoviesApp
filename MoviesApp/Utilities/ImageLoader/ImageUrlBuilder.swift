//
//  ImageUrlBuilder.swift
//  MoviesApp
//
//  Created by AhmedFitoh on 7/27/21.
//

import Foundation

class ImageUrlBuilder {
    
    enum ImageSize: String {
        case original
        case w500
        case w342
        case w154
        case w92
    }

    static func getUrl(stringUrl: String?, size: ImageSize) -> URL?{
        guard var stringUrl = stringUrl, !stringUrl.isEmpty else {
            return nil
        }
        stringUrl = "https://image.tmdb.org/t/p/\(size.rawValue)\(stringUrl)".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
        return URL(string: stringUrl)
    }
}

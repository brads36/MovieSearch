//
//  Movie.swift
//  MovieSearch
//
//  Created by Bryce Bradshaw on 5/1/20.
//  Copyright © 2020 Bryce Bradshaw. All rights reserved.
//

import Foundation

struct Results: Codable {
    let results: [Movie]
}

struct Movie: Codable {
    let rating: Float
    let imagePath: String?
    let id: Int
    let title: String
    let overview: String
    
    enum CodingKeys: String, CodingKey {
        case rating = "vote_average"
        case imagePath = "poster_path"
        case id
        case title
        case overview
    }
}

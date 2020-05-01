//
//  Movie.swift
//  MovieSearch
//
//  Created by Bryce Bradshaw on 5/1/20.
//  Copyright © 2020 Bryce Bradshaw. All rights reserved.
//

import Foundation

struct Results: Codable {
    var results: [Movie]
}

struct Movie: Codable {
    
    
    let image: String
    let id: Int
    let rating: Float
    let title: String
    let overview: String
    
    enum Codingkeys: String, CodingKey {
        case image = "poster_path"
        case rating = "vote_average"
    }
}

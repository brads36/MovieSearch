//
//  MovieSearchError.swift
//  MovieSearch
//
//  Created by Bryce Bradshaw on 5/1/20.
//  Copyright © 2020 Bryce Bradshaw. All rights reserved.
//

import Foundation

enum MovieSearchError: LocalizedError {
    
    case invalidURL
    case thrownError(Error)
    case noData
    case unableToDecode
    
    var errorDescription: String?{
        switch self{
            
        case .invalidURL:
            return "We have an invalid url"
        case .thrownError(let error):
            return error.localizedDescription
        case .noData:
            return "We have no data"
        case .unableToDecode:
            return "We were not able to decode"
        }
    }
}

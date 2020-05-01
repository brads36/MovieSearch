//
//  MovieController.swift
//  MovieSearch
//
//  Created by Bryce Bradshaw on 5/1/20.
//  Copyright © 2020 Bryce Bradshaw. All rights reserved.
//

import Foundation
import UIKit.UIImage

class MovieController {
    //http://api.themoviedb.org/3/search/movie?api_key=31413ac43957974e65dbebd95b8aeaaf&query=Jack+Reacher
    //https://api.themoviedb.org/3/search/movie?api_key=31413ac43957974e65dbebd95b8aeaaf&query=P
    static let baseURL = URL(string: "https://api.themoviedb.org/3/search/movie")
    static let apiKeyValue = "31413ac43957974e65dbebd95b8aeaaf"
    static let apiKey = "api_key"
    static let query = "query"
    /*
     url for image
     https://api.themoviedb.org/3/movie/(movie.Id)/images?api_key=31413ac43957974e65dbebd95b8aeaaf&language=en-US
     */
    
    static func fetchMoviesFor(searchTerm: String, completion: @escaping (Result<[Movie], MovieSearchError>) -> Void) {

        // 1. Prep URL
        guard let baseURL = baseURL else { return completion(.failure(.invalidURL))}
        let url = baseURL
        
        var components = URLComponents(url: url, resolvingAgainstBaseURL: true)
        
        let apiKeyQuery = URLQueryItem(name: apiKey, value: apiKeyValue)
        let searchQuery = URLQueryItem(name: query, value: searchTerm)
        components?.queryItems = [apiKeyQuery, searchQuery]
        
        guard let finalURL = components?.url else { return completion(.failure(.invalidURL))}
        print(finalURL)
        // 2. Contact Server
        URLSession.shared.dataTask(with: finalURL) { (data, _, error) in
            //print("a")
            // 3. Handle Errors
            if let error = error {
                print(error.localizedDescription)
                return completion(.failure(.thrownError(error)))
            }
            
            // 4. Check for data
            guard let data = data else {return completion(.failure(.noData))}
            
            // 5. Decode JSON
            do {
                let topLevelObject = try JSONDecoder().decode(Results.self, from: data)
                let movies = topLevelObject.results
                return completion(.success(movies))
            } catch {
                print(error.localizedDescription)
                return completion(.failure(.thrownError(error)))
            }
            
        }.resume()
    }
    
    static func fetchImageWith(movieId: Int, completion: @escaping(Result<UIImage, MovieSearchError>) -> Void) {
        
    }
}

//
//  NetworkManager.swift
//  Wrist Movies WatchKit Extension
//
//  Created by Narcis Zait on 05/03/2020.
//  Copyright © 2020 Narcis Zait. All rights reserved.
//

import Foundation

enum NetworkError: Error {
    case invalidURL
    case unknownError
    case decodingError
}

let baseURL = "http://trailers.apple.com/trailers/"
let newestMoviesURL = "http://trailers.apple.com/trailers/home/feeds/just_added.json"

class NetworkManager {
    func getNewestMoviews(completion: @escaping (Result<[Movie], NetworkError>) -> Void) {
        guard let url = URL(string: baseURL) else {
            completion(.failure(.invalidURL))
            return
        }
        
        URLSession.shared.dataTask(with: url) {data, response, error in
        guard let data = data, error == nil else {
            completion(.failure(.unknownError))
            return
        }
            
//        let movies = try? JSONDecoder.decode([Movie].self, from: data)
            let decoder = JSONDecoder()
            let movies = try? decoder.decode([Movie].self , from: data)
        movies == nil ? completion(.failure(.decodingError)) : completion(.success(movies!))
        }.resume()
    }
    
//    func getMovieTrailer(trailerString: String) {
//        let movieTrailerURL = baseURL + trailerString
//        guard let url = URL(string: movieTrailerURL) else {
//            return
//        }
//
//
//    }
}
//
//  Movie.swift
//  MyFavoriteMovies
//
//  Created by xengar on 2017-11-27.
//  Copyright © 2017 xengar. All rights reserved.
//

import UIKit

// MARK: - Movie

struct Movie {
    
    // MARK: Properties
    
    let title: String
    let id: Int
    let posterPath: String?
    
    // MARK: Initializers
    
    init(dictionary: [String:AnyObject]) {
        title = dictionary[Constants.TMDBResponseKeys.Title] as! String
        id = dictionary[Constants.TMDBResponseKeys.ID] as! Int
        posterPath = dictionary[Constants.TMDBResponseKeys.PosterPath] as? String
    }
    
    static func moviesFromResults(_ results: [[String:AnyObject]]) -> [Movie] {
        
        var movies = [Movie]()
        
        // iterate through array of dictionaries, each Movie is a dictionary
        for result in results {
            movies.append(Movie(dictionary: result))
        }
        
        return movies
    }
    
}

// MARK: - Movie: Equatable

extension Movie: Equatable {}

func ==(lhs: Movie, rhs: Movie) -> Bool {
    return lhs.id == rhs.id
}

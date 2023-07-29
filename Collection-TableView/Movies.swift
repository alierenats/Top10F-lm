//
//  Movies.swift
//  Collection-TableView
//
//  Created by Eren Ates on 28.07.2023.
//

import Foundation

class Movies {
    
    var movieID:Int?
    var movieImageName:String?
    var genre:String?
    init()
    {
    }
    
    init(movieID:Int,movieImageName:String,genre:String) {
          self.movieID = movieID
          self.movieImageName = movieImageName
        self.genre = genre
      }
}

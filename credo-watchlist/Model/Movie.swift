//
//  Movie.swift
//  credo-watchlist
//
//  Created by Alan Milke on 22/04/25.
//

import Foundation
import SwiftData

@Model
class Movie {
    var title: String
    var genre: Genre
    
    init (title: String, genre: Genre) {
        self.title = title
        self.genre = genre
    }
}

extension Movie {
    @MainActor
    static var preview: ModelContainer {
        let container = try! ModelContainer(for: Movie.self, configurations: ModelConfiguration(isStoredInMemoryOnly: true))
        container.mainContext.insert(Movie(title: "Matrix", genre: .action))
        container.mainContext.insert(Movie(title: "Ground hog day", genre: .comedy))
        container.mainContext.insert(Movie(title: "Toy Story", genre: .animation))
        container.mainContext.insert(Movie(title: "Lord of the Rings", genre: .fantasy))
        container.mainContext.insert(Movie(title: "The revenant", genre: .drama))
        container.mainContext.insert(Movie(title: "Dirty Dancing", genre: .drama))
        container.mainContext.insert(Movie(title: "Jhon Wick", genre: .action))
        container.mainContext.insert(Movie(title: "Wolverine and Deadpool", genre: .action))
        container.mainContext.insert(Movie(title: "IT", genre: .horror))
        
        return container
    }
}

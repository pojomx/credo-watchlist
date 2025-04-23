//
//  Genre.swift
//  credo-watchlist
//
//  Created by Alan Milke on 22/04/25.
//

import Foundation
enum Genre: Int, Codable, CaseIterable, Identifiable {
    
    var id: Int {
        rawValue
    }
    
    case action             = 1
    case adventure          = 2
    case animation          = 3
    case comedy             = 4
    case drama              = 5
    case fantasy            = 6
    case horror             = 7
    case mystery            = 8
    case thriller           = 9
    case romance            = 10
    case scienceFiction     = 11
    case tvMovie            = 12
    case western            = 13
    
}

extension Genre {
    var name: String {
        switch self {
        case .action:
            "action"
        case .adventure:
            "adventure"
        case .animation:
            "animation"
        case .comedy:
            "comedy"
        case .drama:
            "drama"
        case .fantasy:
            "fantasy"
        case .horror:
            "horror"
        case .mystery:
             "mystery"
        case .thriller:
             "thriller"
        case .romance:
             "romance"
        case .scienceFiction:
             "science fiction"
        case .tvMovie:
             "tv movie"
        case .western:
             "western"
        }
    }
}

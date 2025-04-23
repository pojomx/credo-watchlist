//
//  credo_watchlistApp.swift
//  credo-watchlist
//
//  Created by Alan Milke on 22/04/25.
//

import SwiftUI
import SwiftData

@main
struct credo_watchlistApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .modelContainer(for: Movie.self)
        }
    }
}

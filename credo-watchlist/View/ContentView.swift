//
//  ContentView.swift
//  credo-watchlist
//
//  Created by Alan Milke on 22/04/25.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    //MARK: - Properties
    @Environment(\.modelContext) var modelContext
    @State private var movies: [Movie] = []
    
    var body: some View {
        List {
            
        } //: List
        .overlay {
            if movies.isEmpty {
                EmptyListView()
            }
        }
    }
}

#Preview ("No Data") {
    ContentView()
        .modelContainer(for: Movie.self, inMemory: true)
}

#Preview ("Some Data") {
    ContentView()
        .modelContainer(Movie.preview)
        .preferredColorScheme(.dark)
        
}

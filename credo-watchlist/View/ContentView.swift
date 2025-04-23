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
    @Query private var movies: [Movie] = []
    
    @State private var isSheetPresented: Bool = false
    
    var body: some View {
        List {
            ForEach(movies) { movie in
                HStack {
                    Text(movie.title)
                    Spacer()
                    Text(movie.genre.name)
                } //: HStack - List Row
                .swipeActions(edge: .trailing) {
                    Button(role: .destructive) {
                        withAnimation {
                            modelContext.delete(movie)
                        }
                    } label: {
                        Label("Delete", systemImage: "trash")
                    }
                }
            }
        } //: List
        .overlay {
            if movies.isEmpty {
                EmptyListView()
            }
        }
        // MARK: - SAFE AREA
        .safeAreaInset(edge: .bottom, alignment: .center) {
            //NEW MOVIE BUTTON
            Button {
                isSheetPresented.toggle()
            } label: {
                ButtonImageView(symbolName: "plus.circle.fill")
            }
        }//: SAFE AREA
        .sheet(isPresented: $isSheetPresented) {
            NewMovieFormView()
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

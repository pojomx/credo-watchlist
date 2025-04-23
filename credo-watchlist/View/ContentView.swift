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
    @State private var isShowingAlert: Bool = false
    @State private var randomMovie: String = ""
    
    //MARK: - FUNCTIONS
    
    private func randomMovieGenerator() {
        randomMovie = movies.randomElement()!.title
    }


    var body: some View {
        List {
            if !movies.isEmpty {
                Section(header:
                VStack {
                    Text("Watchlist")
                        .font(.largeTitle.weight(.black))
                        .foregroundStyle(.blue.gradient)
                        .padding()
                    HStack {
                        Label("Title", systemImage: "movieclapper")
                        Spacer()
                        Label("Genre", systemImage: "tag")
                    }
                }) {
                    ForEach(movies) { movie in
                        HStack {
                            Text(movie.title)
                                .font(.title.weight(.light))
                                .padding(.vertical, 2)
                            
                            Spacer()
                            Text(movie.genre.name)
                                .font(.footnote.weight(.medium))
                                .padding(.horizontal, 6)
                                .padding(.vertical, 3)
                                .background(
                                    Capsule()
                                        .stroke(lineWidth: 1)
                                )
                                .foregroundStyle(.tertiary)
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
            HStack {
                if movies.count >= 2 {
                    Button {
                        randomMovieGenerator()
                        isShowingAlert = true
                    } label: {
                        ButtonImageView(symbolName: "arrow.trianglehead.2.clockwise.rotate.90.circle.fill")
                    }
                    .alert(randomMovie, isPresented: $isShowingAlert) {
                        Button("OK", role: .cancel) {}
                    }
                    .accessibilityLabel("Random Movie")
                    .sensoryFeedback(.success, trigger: isShowingAlert)
                }
                Spacer()
                Button {
                    isSheetPresented.toggle()
                } label: {
                    ButtonImageView(symbolName: "plus.circle.fill")
                }
                .accessibilityLabel("New Movie")
                .sensoryFeedback(.success, trigger: isSheetPresented)
            }
            .padding(.horizontal)
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

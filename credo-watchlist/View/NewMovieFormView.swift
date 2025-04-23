//
//  NewMovieFormView.swift
//  credo-watchlist
//
//  Created by Alan Milke on 23/04/25.
//

import SwiftUI

struct NewMovieFormView: View {
    //MARK: - PROPERTIES
    @Environment(\.modelContext) var modelContext
    @Environment(\.dismiss) var dismiss
    
    @State private var title: String = ""
    @State private var selectedGenre: Genre = .action
    
    //MARK: - FUNCTIONS
    
    private func addMovie() {
        guard !title.isEmpty else { return }
        let newMovie = Movie(title: title, genre: selectedGenre)
        modelContext.insert(newMovie)
        
        title = ""
        selectedGenre = .action
    }
    
    var body: some View {
        Form {
            List {
                //MARK: - HEADER
                Text("What to watch")
                    .font(.largeTitle.weight(.black))
                    .foregroundStyle(.blue.gradient)
                    .frame(minWidth: 0, maxWidth: .infinity, alignment: .center)
                    .padding(.vertical)
                //MARK: - TITLE
                TextField("Movie Title", text: $title)
                    .textFieldStyle(.roundedBorder)
                    .font(.largeTitle.weight(.light))
                //MARK: - GENRE
                Picker("Genre", selection: $selectedGenre) {
                    ForEach(Genre.allCases) { genre in
                        Text(genre.name)
                            .tag(genre)
                    }
                }
                //MARK: - SAVE BUTTON
                Button {
                    addMovie()
                    dismiss()
                } label: {
                    Text("Save")
                        .font(.title2.weight(.medium))
                        .frame(maxWidth: .infinity)
                }
                .buttonStyle(.borderedProminent)
                .controlSize(.extraLarge)
                .buttonBorderShape(.roundedRectangle)
                //MARK: - CANCEL BUTTON
                Button {
                    dismiss()
                } label: {
                    Text("Close")
                        .frame(maxWidth: .infinity)
                }
            }//: List
            .listRowSeparator(.hidden)
        } //: Form
    }
}

#Preview {
    NewMovieFormView()
}

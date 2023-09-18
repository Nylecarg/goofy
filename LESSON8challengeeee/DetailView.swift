//
//  DetailView.swift
//  LESSON8challengeeee
//
//  Created by Gracelyn Gosal on 28/8/23.
//

import SwiftUI

struct DetailView: View {
    @Binding var note: Note
    @Binding var notes: [Note]
    
    var body: some View {
        VStack {
            Text(note.title)
                .font(.title)
                .padding()
            
            TextEditor(text: $note.content)
                .padding()
            
            Button("Delete Candidate") {
                if let index = notes.firstIndex(where: { $0.id == note.id }) {
                    notes.remove(at: index)
                }
            }
            .foregroundColor(.red)
        }
        .navigationTitle("Candidate details")
    }
}




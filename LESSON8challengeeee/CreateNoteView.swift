//
//  CreateNoteView.swift
//  LESSON8challengeeee
//
//  Created by Gracelyn Gosal on 28/8/23.
//

import SwiftUI

struct CreateNoteView: View {
    @Binding var isPresented: Bool
    @Binding var notes: [Note]
    @State private var newTitle: String = ""
    @State private var newContent: String = ""
    
    var body: some View {
        NavigationView {
            Form {
                TextField("Name", text: $newTitle)
                TextField("Details (age, party)", text: $newContent)
            }
            .navigationTitle("Create New candidate")
            .navigationBarItems(leading: Button("Cancel") {
                isPresented = false
            }, trailing: Button("Save") {
                saveNote()
            })
        }
    }
    
    private func saveNote() {
        let newNote = Note(title: newTitle, content: newContent)
        notes.append(newNote)
        
        newTitle = ""
        newContent = ""
        
        isPresented = false
    }
}

struct CreateNoteView_Previews: PreviewProvider {
    static var previews: some View {
        CreateNoteView(isPresented: .constant(false), notes: .constant([]))
    }
}



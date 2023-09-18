//
//  candidateView.swift
//  LESSON8challengeeee
//
//  Created by Gracelyn Gosal on 28/8/23.
//

import SwiftUI

struct Note: Identifiable {
    let id = UUID()
    var title: String
    var content: String
}

struct NoteApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

struct candidateView: View {
    @Binding var notes: [Note]
    @State private var isCreateNoteViewPresented = false
    @State private var isSettingsViewPresented = false
    @AppStorage("isDarkModeEnabled") private var isDarkModeEnabled = false
    
    var body: some View {
        NavigationView {
            List {
                ForEach($notes) { $note in
                    NavigationLink(destination: DetailView(note: $note, notes: $notes)) {
                        Text(note.title)
                    }
                }
            }
            .navigationTitle("Candidates")
            .toolbar {
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    Button(action: {
                        isCreateNoteViewPresented = true
                    }) {
                        Image(systemName: "plus")
                    }
                    Button(action: {
                        isSettingsViewPresented = true
                    }) {
                        Image(systemName: "gear")
                    }
                }
            }
            .sheet(isPresented: $isCreateNoteViewPresented) {
                CreateNoteView(isPresented: $isCreateNoteViewPresented, notes: $notes)
            }
            .sheet(isPresented: $isSettingsViewPresented) {
                SettingsView(isPresented: $isSettingsViewPresented, isDarkModeEnabled: $isDarkModeEnabled)
            }
            .preferredColorScheme(isDarkModeEnabled ? .dark : .light)
        }
    }
    
    var candidateNames: [String] {
        notes.map { $0.title }
    }
}


struct candidateView_Previews: PreviewProvider {
    static var previews: some View {
        let notes: [Note] = [
            Note(title: "Dmitry", content: "This is Dmitry. Runs the Rhodesian marxist party"),
            Note(title: "Ivan", content: "This is Ivan. Runs the Rhodesian labour party")
        ]
        
        return candidateView(notes: .constant(notes))
    }
}

//
//  ContentView.swift
//  LESSON8challengeeee
//
//  Created by Gracelyn Gosal on 28/8/23.
//
import SwiftUI

struct ContentView: View {
    @State var notes: [Note] = [
        Note(title: "Dmitry", content: "This is Dmitry. Runs the Rhodesian marxist party"),
        Note(title: "Ivan", content: "This is Ivan. Runs the Rhodesian labour party")
    ]

    var body: some View {
        TabView {
            votingView(candidateNames: candidateNames)
                .tabItem {
                    VStack {
                        Image(systemName: "person.fill")
                        Text("Voting")
                    }
                }
            candidateView(notes: $notes)
                .tabItem {
                    VStack {
                        Image(systemName: "folder.fill")
                        Text("Candidate Info")
                    }
                }
        }
    }

    var candidateNames: [String] {
        notes.map { $0.title }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

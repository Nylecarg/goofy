//
//  votingView.swift
//  LESSON8challengeeee
//
//  Created by Gracelyn Gosal on 28/8/23.
//

import SwiftUI

struct votingView: View {
    var candidateNames: [String]
    @State private var votes: [Int]
    
    init(candidateNames: [String]) {
        self.candidateNames = candidateNames
        self.votes = Array(repeating: 0, count: 10)
    }
    
    var body: some View {
        NavigationView {
            List(0..<candidateNames.count, id: \.self) { index in
                HStack {
                    Text(candidateNames[index])
                    Spacer()
                    Stepper("Votes: \(votes[index])", value: $votes[index], in: 0...10)
                }
            }
            .navigationTitle("Vote for Candidates")
        }
    }
}

struct votingView_Previews: PreviewProvider {
    static var previews: some View {
        let candidateNames = ["Dmitry", "Ivan"]
        return votingView(candidateNames: candidateNames)
    }
}

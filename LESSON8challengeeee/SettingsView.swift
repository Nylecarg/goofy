//
//  SettingsView.swift
//  LESSON8challengeeee
//
//  Created by Gracelyn Gosal on 28/8/23.
//

import SwiftUI

struct SettingsView: View {
    @Binding var isPresented: Bool
    @Binding var isDarkModeEnabled: Bool
    
    var body: some View {
        NavigationView {
            Form {
                Toggle(isOn: $isDarkModeEnabled) {
                    Text("Dark Mode")
                }
            }
            .navigationBarTitle("Settings", displayMode: .inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Done") {
                        isPresented = false
                    }
                }
            }
        }
    }
}


struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView(isPresented: .constant(false), isDarkModeEnabled: .constant(false))
    }
}


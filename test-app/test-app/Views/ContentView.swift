//
//  ContentView.swift
//  test-app
//
//  Created by Ryan Skinner on 7/22/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            VStack {
                Image(systemName: "globe")
                    .imageScale(.large)
                    .foregroundStyle(.tint)
                Text("Hello, world!")
                Button("Go to Second View") {
                    // Navigation handled by NavigationLink
                }
                NavigationLink(destination: SecondView()) {
                    Text("Go to Second View")
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
            }
            .padding()
        }
    }
}

#Preview {
    ContentView()
}

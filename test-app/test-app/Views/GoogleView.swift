//
//  GoogleView.swift
//  test-app
//
//  Created by Ryan Skinner on 7/22/25.
//

import SwiftUI

struct GoogleView: View {
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
                NavigationLink(destination: TaskView()) {
                    Text("Go to Task View")
                        .padding()
                        .background(Color.green)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
            }
            .padding()
        }
    }
}

#Preview {
    GoogleView()
}

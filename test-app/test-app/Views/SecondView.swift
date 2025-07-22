import SwiftUI

struct SecondView: View {
    @State private var statusMessage: String = ""
    @State private var showHeadersSheet: Bool = false
    @State private var headers: [(String, String)] = []
    
    var body: some View {
        VStack(spacing: 20) {
            Text("This is the second view!")
                .font(.largeTitle)
                .padding()
            Button("Make Request to Google") {
                makeGoogleRequest()
            }
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(8)
            if !statusMessage.isEmpty {
                Text(statusMessage)
                    .foregroundColor(.gray)
            }
        }
        .sheet(isPresented: $showHeadersSheet) {
            VStack(alignment: .leading, spacing: 16) {
                Text("Response Headers")
                    .font(.headline)
                ForEach(headers, id: \.0) { header in
                    HStack {
                        Text(header.0 + ":")
                            .bold()
                        Text(header.1)
                    }
                }
                Spacer()
                Button("Close") {
                    showHeadersSheet = false
                }
                .padding()
            }
            .padding()
        }
    }
    
    func makeGoogleRequest() {
        guard let url = URL(string: "https://www.google.com") else {
            statusMessage = "Invalid URL"
            return
        }
        statusMessage = "Loading..."
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            DispatchQueue.main.async {
                if let error = error {
                    statusMessage = "Error: \(error.localizedDescription)"
                } else if let httpResponse = response as? HTTPURLResponse {
                    statusMessage = "Response: \(httpResponse.statusCode)"
                    // Extract selected headers
                    let wantedHeaders = ["Content-Type", "Date", "Server"]
                    headers = wantedHeaders.compactMap { key in
                        if let value = httpResponse.value(forHTTPHeaderField: key) {
                            return (key, value)
                        } else {
                            return nil
                        }
                    }
                    if !headers.isEmpty {
                        showHeadersSheet = true
                    }
                } else {
                    statusMessage = "Unknown response"
                }
            }
        }
        task.resume()
    }
}

#Preview {
    SecondView()
} 
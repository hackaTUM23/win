//
//  AcceptEventModalView.swift
//  engage-client
//
//  Created by Nikolai Madlener on 23.11.24.
//

import SwiftUI

struct AcceptEventModalView: View {
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var appState: AppState
    
    @State var activity: Activity?
    @State private var loading = true
    
    var body: some View {
        VStack {
            if !loading {
                Text("Get going!").font(.custom("Nunito-Bold", size: 24)).padding()
                Image("spriessen")
                    .resizable()
                    .frame(width: 100, height: 100)
                    .foregroundColor(.white)
                    .clipShape(Circle())
                    .padding()
                ChatActivitySummaryView(activity: MockActivities.activities[0], user: MockUsers.users[0])
                Spacer()
                HStack {
                    Button("Tomorrow, I promise", role: .cancel) {
                        dismiss()
                    }
                    .buttonStyle(.bordered)
                    .padding()
                    .frame(maxWidth: .infinity)
                    Button("Let's Go!") {
                        accept()
                    }
                    .buttonStyle(.borderedProminent)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .disabled((activity == nil))
                }
            } else {
                ProgressView()
            }
        }.task {
            await fetchActivity()
            loading = false
        }
    }
    
    func accept() {
        appState.nextActivity = activity
        dismiss()
    }
    
    func fetchActivity() async { // todo - pass uid and filters
        do {
            let url = URL(string: "https://engage-api-dev-855103304243.europe-west3.run.app/subscriptions/find_matching_subscription")!
            
            var request = URLRequest(url: url)
            request.httpMethod = "POST"
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            let requestBody: [String: Any] = [
                "user_id": appState.user.id,
                "preferences": appState.preferences
            ]
            request.httpBody = try JSONSerialization.data(withJSONObject: requestBody)
            
            let (data, _) = try await URLSession.shared.data(for: request)
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .iso8601
            activity = try decoder.decode(Activity.self, from: data)
        } catch {
            print(error)
        }
    }
}

#Preview {
    AcceptEventModalView(activity: MockActivities.activities[0])
}

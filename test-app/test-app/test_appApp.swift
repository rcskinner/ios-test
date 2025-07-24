//
//  test_appApp.swift
//  test-app
//
//  Created by Ryan Skinner on 7/22/25.
//

import SwiftUI
import DatadogCore
import DatadogRUM

@main
struct test_appApp: App {
    init() {
        let appID = Bundle.main.infoDictionary?["DATADOG_APP_ID"] as? String ?? ""
        let clientToken = Bundle.main.infoDictionary?["DATADOG_CLIENT_TOKEN"] as? String ?? ""
        let environment = Bundle.main.infoDictionary?["DATADOG_ENV"] as? String ?? ""

        Datadog.initialize(
            with: Datadog.Configuration(
                clientToken: clientToken,
                env: environment,
                site: .us1
            ),
            trackingConsent: .granted
        )

        RUM.enable(
            with: RUM.Configuration(
                applicationID: appID,
                uiKitViewsPredicate: DefaultUIKitRUMViewsPredicate(),
                uiKitActionsPredicate: DefaultUIKitRUMActionsPredicate()
            )
        )
    }

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

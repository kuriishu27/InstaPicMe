//
//  InstaPicMeApp.swift
//  InstaPicMe
//
//  Created by Christian Leovido on 28/07/2020.
//

import SwiftUI
import Firebase

@main
struct InstaPicMeApp: App {

    let config: Void = FirebaseApp.configure()

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

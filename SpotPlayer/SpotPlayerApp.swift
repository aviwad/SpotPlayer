//
//  SpotPlayerApp.swift
//  SpotPlayer
//
//  Created by Avi Wadhwa on 2022-04-15.
//

import SwiftUI
import Combine
import SpotifyWebAPI
import Introspect

@main
struct SpotPlayerApp: App {
    /*@StateObject var spotify = Spot()
    init() {
        SpotifyAPILogHandler.bootstrap()
    }*/
    var body: some Scene {
        WindowGroup {
            ContentView()
                .preferredColorScheme(.dark)
                .onAppear {
                    NSWindow.allowsAutomaticWindowTabbing = false
                }
        }
        //.windowToolbarStyle(UnifiedWindowToolbarStyle(showsTitle: false))
        //ContentView()
        //.windowStyle(HiddenTitleBarWindowStyle())
    }
}

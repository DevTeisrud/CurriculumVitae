//
//  iOSApp.swift
//  iOS
//
//  Created by Bjørn Kristian Teisrud on 03/10/2022.
//

import SwiftUI

@main
struct iOSApp: App {
    @StateObject private var modelData = ModelData()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(modelData)

        }
    }
}

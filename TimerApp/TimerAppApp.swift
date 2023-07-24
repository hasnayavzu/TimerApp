//
//  TimerAppApp.swift
//  TimerApp
//
//  Created by Hasan Yavuz on 10.07.2023.
//

import SwiftUI

@main
struct TimerAppApp: App {
    
    @StateObject var data = TimerModel()
    
    @Environment(\.scenePhase) var scene
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .onChange(of: scene) { (newScene) in
            if newScene == .background {
                // Storing Time...
                data.leftTime = Date()
                print(data.totalSeconds)
                print(data.staticTotalSeconds)
                print(data.seconds)
                print("bırt")
            }
            if newScene == .active {
                //when it enter app again
                let diff = Date().timeIntervalSince(data.leftTime)
                
                let currentTime = data.totalSeconds - Int(diff)
                
                if currentTime >= 0 {
                    withAnimation(.default) {
                        data.
                    }
                }
            }
        }
    }
}

//
//  TimerModel.swift
//  TimerApp
//
//  Created by Hasan Yavuz on 13.07.2023.
//

import SwiftUI

class TimerModel: NSObject, ObservableObject {
    // Timer Properties...
    @Published var progress: CGFloat = 1
    @Published var timerStringValue: String = "00:00"
    @Published var isStarted: Bool = false
    @Published var addNewTimer: Bool = false

    @Published var hours: Int = 0
    @Published var minutes: Int = 0
    @Published var seconds: Int = 0

    // Getting time when we leave the app
    @Published var leftTime: Date = Date()

    @Published var totalSeconds: Int = 0
    @Published var staticTotalSeconds: Int = 0

    @Published var isFinished: Bool = false

    func startTimer() {
        withAnimation(.easeInOut(duration: 0.25)) { isStarted = true }
        timerStringValue = "\(hours == 0 ? "" : "\(hours):")\(minutes >= 10 ? "\(minutes)" : "\(minutes)"):\(seconds >= 10 ? "\(seconds)" : "0\(seconds)")"
        // Calculation Total Seconds For Timer Animation
        totalSeconds = (hours * 3600) + (minutes * 60) + seconds
        staticTotalSeconds = totalSeconds
        addNewTimer = false
    }

    func stopTimer() {
        withAnimation {
            isStarted = false
            hours = 0
            minutes = 0
            seconds = 0
            progress = 1
        }
        totalSeconds = 0
        staticTotalSeconds = 0
        timerStringValue = "00:00"
    }

    func updateTimer() {
        totalSeconds -= 1
        progress = CGFloat(totalSeconds) / CGFloat(staticTotalSeconds)
        progress = (progress < 0 ? 0 : progress)
        hours = totalSeconds / 3600
        minutes = (totalSeconds / 60) % 60
        seconds = (totalSeconds % 60)
        timerStringValue = "\(hours == 0 ? "" : "\(hours):")\(minutes >= 10 ? "\(minutes)" : "\(minutes)"):\(seconds >= 10 ? "\(seconds)" : "0\(seconds)")"
        if hours == 0 && minutes == 0 && seconds == 0 {
            isStarted = false
            isFinished = true
        }
    }
}

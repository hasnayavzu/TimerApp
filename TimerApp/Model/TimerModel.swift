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
}

//
//  TimerView.swift
//  TimerApp
//
//  Created by Hasan Yavuz on 11.07.2023.
//

import SwiftUI

struct TimerView: View {
    
    @StateObject var timerModel: TimerModel = .init()
    
    var body: some View {
        ZStack {
            
            Color.black.opacity(0.06).edgesIgnoringSafeArea(.all)
            
            ZStack {
                Circle()
                    .trim(from: 0, to: 1)
                        .stroke(Color.black.opacity(0.09), style: StrokeStyle(lineWidth: 30, lineCap:  .round))
                    .frame(width: 320, height: 320)
                Circle()
                    .trim(from: 0, to: 0.5)
                        .stroke(Color.blue, style: StrokeStyle(lineWidth: 30, lineCap:  .round))
                    .frame(width: 320, height: 320)
                    .rotationEffect(.init(degrees: -90))
                // Knob
                Circle()
                    .fill(.blue)
                    .frame(width: 50,height: 50)
                    .overlay {
                        Circle()
                            .fill(.white)
                            .padding(10)
                    }
                    .offset(x: 0, y: 160)
                Text("00:00")
                    .fontWeight(.semibold)
                    .font(.largeTitle)
            }
        }
        // Timer Screen Here...
    }
}

struct TimerView_Previews: PreviewProvider {
    static var previews: some View {
        TimerView()
    }
}

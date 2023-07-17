//
//  TimerView.swift
//  TimerApp
//
//  Created by Hasan Yavuz on 11.07.2023.
//

import SwiftUI

struct TimerView: View {
    @EnvironmentObject var timerModel: TimerModel

    var body: some View {
        VStack {
            HStack(alignment: .center, spacing: 20) {
                Spacer()
                Image(systemName: "bell.fill")
                Image(systemName: "music.note")
                Image("hasan")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 40, height: 40)
                    .cornerRadius(20)
            }
            .padding()

            GeometryReader { proxy in
                VStack(spacing: 15) {
                    ZStack {
                        Circle()
                            .trim(from: 0, to: 1)
                            .stroke(Color.black.opacity(0.09), style: StrokeStyle(lineWidth: 30, lineCap: .round))
                        Circle()
                            .trim(from: 0, to: timerModel.progress)
                            .stroke(Color.blue, style: StrokeStyle(lineWidth: 30, lineCap: .round))
                        // Knob

                        GeometryReader { proxy in
                            let size = proxy.size

                            Circle()
                                .fill(.blue)
                                .frame(width: 50, height: 50)
                                .overlay {
                                    Circle()
                                        .fill(.white)
                                        .padding(10)
                                }
                                .frame(width: size.width, height: size.height, alignment: .center)
                                .offset(x: size.height / 2)
                                .rotationEffect(.init(degrees: timerModel.progress * 360))
                        }
                        Text(timerModel.timerStringValue)
                            .font(.system(size: 45, weight: .light))
                            .rotationEffect(.init(degrees: -90))
                    }
                    .padding(40)
                    .frame(height: proxy.size.width)
                    .rotationEffect(.init(degrees: -90))
                    .animation(.easeInOut, value: timerModel.progress)
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)

                    Button {
                        if timerModel.isStarted {
                        } else {
                            timerModel.addNewTimer = true
                        }
                    } label: {
                        Image(systemName: !timerModel.isStarted ? "timer" : "pause")
                            .font(.largeTitle.bold())
                            .foregroundColor(.white)
                            .frame(width: 80, height: 80)
                            .background {
                                Circle()
                                    .fill(.blue)
                            }
                            .shadow(color: .blue, radius: 8, x: 0, y: 0)
                    }
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
            }
        }
        .padding()
    }
}

struct TimerView_Previews: PreviewProvider {
    static var previews: some View {
        TimerView()
            .environmentObject(TimerModel())
    }
}

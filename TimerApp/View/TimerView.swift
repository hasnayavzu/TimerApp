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
                            .rotationEffect(.init(degrees: 90))
                    }
                    .padding(40)
                    .frame(height: proxy.size.width)
                    .rotationEffect(.init(degrees: -90))
                    .animation(.easeInOut, value: timerModel.progress)
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)

                    Button {
                        if timerModel.isStarted {
                            timerModel.stopTimer()
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
        .overlay {
            ZStack {
                Color.black
                    .opacity(timerModel.addNewTimer ? 0.25 : 0)
                    .onTapGesture {
                        timerModel.addNewTimer = false
                    }
                NewTimerView()
                    .frame(maxHeight: .infinity, alignment: .bottom)
                    .offset(y: timerModel.addNewTimer ? 0 : 400)
            }
            .ignoresSafeArea()
            .animation(.easeInOut, value: timerModel.addNewTimer)
        }
        .onReceive(Timer.publish(every: 1, on: .main, in: .common).autoconnect()) {
            _ in
            if timerModel.isStarted {
                timerModel.updateTimer()
            }
        }
        .alert("Congratulations, Timer Completed!", isPresented: $timerModel.isFinished) {
            Button("Start New", role: .cancel) {
                timerModel.stopTimer()
                timerModel.addNewTimer = true
            }
            Button("Close", role: .destructive) {
                timerModel.stopTimer()
            }
        }
    }

    @ViewBuilder
    func NewTimerView() -> some View {
        VStack(spacing: 15) {
            Text("Add New Timer")
                .font(.title2.bold())
                .foregroundColor(.blue)
                .padding(.top, 10)
            HStack(spacing: 15) {
                Text("\(timerModel.hours) hr")
                    .font(.title3)
                    .fontWeight(.semibold)
                    .foregroundColor(.white.opacity(0.8))
                    .padding(.horizontal, 20)
                    .padding(.vertical, 12)
                    .background {
                        Capsule()
                            .fill(.blue.opacity(0.3))
                    }
                    .contextMenu {
                        ContextMenuOptions(maxValue: 12, hint: "hr") { value in
                            timerModel.hours = value
                        }
                    }

                Text("\(timerModel.minutes) min")
                    .font(.title3)
                    .fontWeight(.semibold)
                    .foregroundColor(.white.opacity(0.8))
                    .padding(.horizontal, 20)
                    .padding(.vertical, 12)
                    .background {
                        Capsule()
                            .fill(.blue.opacity(0.3))
                    }
                    .contextMenu {
                        ContextMenuOptions(maxValue: 60, hint: "min") { value in
                            timerModel.minutes = value
                        }
                    }

                Text("\(timerModel.seconds) sec")
                    .font(.title3)
                    .fontWeight(.semibold)
                    .foregroundColor(.white.opacity(0.8))
                    .padding(.horizontal, 20)
                    .padding(.vertical, 12)
                    .background {
                        Capsule()
                            .fill(.blue.opacity(0.3))
                    }
                    .contextMenu {
                        ContextMenuOptions(maxValue: 60, hint: "sec") { value in
                            timerModel.seconds = value
                        }
                    } 
            }
            .padding(.top, 20)

            Button {
                timerModel.startTimer()
            } label: {
                Text("Save")
                    .font(.title3)
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                    .padding(.vertical)
                    .padding(.horizontal, 100)
                    .background {
                        Capsule()
                            .fill(.blue)
                    }
            }
            .disabled(timerModel.seconds == 0)
            .opacity(timerModel.seconds == 0 ? 0.5 : 1)
            .padding(.top)
            .padding(.bottom)
        }
        .padding()
        .frame(maxWidth: .infinity)
        .background {
            RoundedRectangle(cornerRadius: 10, style: .continuous)
                .fill(.white)
                .ignoresSafeArea()
        }
    }

    @ViewBuilder
    func ContextMenuOptions(maxValue: Int, hint: String, onClick: @escaping (Int) -> Void) -> some View {
        ForEach(0 ... maxValue, id: \.self) { value in
            Button("\(value) \(hint)") {
                onClick(value)
            }
        }
    }
}

struct TimerView_Previews: PreviewProvider {
    static var previews: some View {
        TimerView()
            .environmentObject(TimerModel())
    }
}

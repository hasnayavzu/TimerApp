//
//  TimerView.swift
//  TimerApp
//
//  Created by Hasan Yavuz on 11.07.2023.
//

import SwiftUI

struct TimerView: View {
    var body: some View {
        ZStack {
            Circle()
                .frame(width: 300)
                .foregroundColor(.blue)
                .overlay {
                    Circle()
                        .foregroundColor(.white)
                        .frame(width: 280)
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

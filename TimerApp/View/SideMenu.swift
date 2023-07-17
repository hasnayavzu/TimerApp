//
//  SideMenu.swift
//  TimerApp
//
//  Created by Hasan Yavuz on 10.07.2023.
//

import SwiftUI

struct SideMenu: View {
    @Binding var selectedTab: String
    @Namespace var animation

    var body: some View {
        VStack(alignment: .leading, spacing: 15, content: {
            // Profile Pic.
            VStack(alignment: .leading, content: {
                Image("hasan")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 70, height: 70)
                    .cornerRadius(35)
                Text("Hasan Yavuz")
                    .font(.title)
                    .foregroundColor(Color.white)
                    .fontWeight(.semibold)
            })
            .padding(.top, 50)
            VStack(alignment: .leading, spacing: 10) {
                TabButton(image: "timer", title: "Timer", selectedTab: $selectedTab, animation: animation)

                TabButton(image: "chart.bar", title: "Progress", selectedTab: $selectedTab, animation: animation)

                TabButton(image: "person.2", title: "Friends", selectedTab: $selectedTab, animation: animation)

                TabButton(image: "clock.arrow.circlepath", title: "History", selectedTab: $selectedTab, animation: animation)
            }
            .padding(.top, 60)

            Spacer()

            TabButton(image: "gearshape", title: "Settings", selectedTab: $selectedTab, animation: animation)

            TabButton(image: "rectangle.righthalf.inset.filled.arrow.right", title: "Log Out", selectedTab: .constant(""), animation: animation)
            Text("App Version 1.0")
                .font(.caption)
                .fontWeight(.semibold)
                .foregroundColor(.white)
                .opacity(0.6)
                .padding(.leading, 13)
        })
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
    }
}

struct SideMenu_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

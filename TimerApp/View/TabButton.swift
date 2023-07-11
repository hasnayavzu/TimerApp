//
//  TabButton.swift
//  TimerApp
//
//  Created by Hasan Yavuz on 10.07.2023.
//

import SwiftUI

struct TabButton: View {
    
    var image: String
    var title: String
    
    // Selected Tab
    @Binding var selectedTab: String
    // For Animation
    var animation: Namespace.ID
    
    var body: some View {
        Button(action: {
            withAnimation(.spring()){selectedTab = title}
        }, label: {
            HStack(spacing: 15) {
                Image(systemName: image)
                    .font(.title2)
                    .frame(width: 30)
                Text(title)
                    .fontWeight(.semibold)
            }
            .foregroundColor(selectedTab == title ? Color.blue : .white)
            .padding(.vertical,12)
            .padding(.horizontal,10)
            // Max Frame...
            .frame(maxWidth: getRect().width - 170, alignment: .leading)
            .background(
                // Hero Animation...
                ZStack {
                    if selectedTab == title {
                        Color.white
                            .opacity(selectedTab == title ? 1 : 0)
                            .clipShape(CustomCorners(corners: .allCorners, radius: 30))
                            .matchedGeometryEffect(id: "TAB", in: animation)
                    }
                }
            )
        })
    }
}

struct TabButton_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

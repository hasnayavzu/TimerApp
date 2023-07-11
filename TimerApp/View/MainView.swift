//
//  MainView.swift
//  TimerApp
//
//  Created by Hasan Yavuz on 10.07.2023.
//

import SwiftUI

struct MainView: View {
    @State var selectedTab = "Timer"
    @State var showMenu = false
    
    var body: some View {
        ZStack {
            Color.blue
                .ignoresSafeArea(.all)
            // Side Menu
            SideMenu(selectedTab: $selectedTab)
            
            ZStack {
                
                Color.white
                    .opacity(0.5)
                    .cornerRadius(showMenu ? 15 : 0)
                    .shadow(color: Color.black.opacity(0.07), radius: 5, x: -5, y: 0)
                    .offset(x: showMenu ? -25 : 0)
                    .padding(.vertical,30)
                
                Color.white
                    .opacity(0.4)
                    .cornerRadius(showMenu ? 15 : 0)
                    .shadow(color: Color.black.opacity(0.07), radius: 5, x: -5, y: 0)
                    .offset(x: showMenu ? -50 : 0)
                    .padding(.vertical,60)
                
                
                Home(selectedTab: $selectedTab)
                    .cornerRadius(showMenu ? 15 : 0)
            }
            .scaleEffect(showMenu ? 0.84 : 1)
            .offset(x: showMenu ? getRect().width - 120 : 0)
            .ignoresSafeArea()
            .overlay (
                Button( action: {
                    withAnimation(.spring()){
                        showMenu.toggle()
                    }
                }, label: {
                    
                    VStack(spacing: 5) {
                        Capsule()
                            .fill(showMenu ? Color.white : Color.primary)
                            .frame(width: 30, height: 3)
                            .rotationEffect(.init(degrees: showMenu ? -45 : 0))
                            .offset(x: showMenu ? 2 : 0, y: showMenu ? 9 : 0)
                        VStack(spacing: 5) {
                            Capsule()
                                .fill(showMenu ? Color.white : Color.primary)
                                .frame(width: 30, height: 3)
                            Capsule()
                                .fill(showMenu ? Color.white : Color.primary)
                                .frame(width: 30, height: 3)
                                .offset(y: showMenu ? -8 : 0)
                        }
                        .rotationEffect(.init(degrees: showMenu ? 45 : 0))
                    }
                    
                })
                .padding()
                
                ,alignment: .topLeading
            )
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}

extension View {
    
    func getRect() -> CGRect {
        return UIScreen.main.bounds
    }
    
}

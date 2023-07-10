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
                Home(selectedTab: $selectedTab)
                    .cornerRadius(showMenu ? 15 : 0)
            }
            .scaleEffect(showMenu ? 0.84 : 1)
            .offset(x: showMenu ? getRect().width - 120 : 0)
            .ignoresSafeArea()
            .overlay {
                Button {
                    withAnimation(.spring()){
                        showMenu.toggle()
                    }
                } label: {
                    Text("Button")
                        .foregroundColor(.black)
                }
                .padding()
                

            }
                
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

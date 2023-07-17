//
//  Home.swift
//  TimerApp
//
//  Created by Hasan Yavuz on 10.07.2023.
//

import SwiftUI

struct Home: View {
    @Binding var selectedTab: String

    // Hiding Tab Bar...
    init(selectedTab: Binding<String>) {
        _selectedTab = selectedTab
        UITabBar.appearance().isHidden = false
    }

    var body: some View {
        // Tab View With Tabs...
        TabView(selection: $selectedTab) {
            Timer()
                .tag("Timer")
            Progress()
                .tag("Progress")
            Friends()
                .tag("Friends")
            History()
                .tag("History")
            Settings()
                .tag("Settings")
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct Timer: View {
    var body: some View {
        NavigationView {
            TimerView()
                .environmentObject(TimerModel())
        }
    }
}

struct Progress: View {
    var body: some View {
        NavigationView {
            Text("Progress")
                .font(.largeTitle)
                .fontWeight(.heavy)
                .foregroundColor(.primary)
                .navigationTitle("Progress")
        }
    }
}

struct Friends: View {
    var body: some View {
        NavigationView {
            Text("Friends")
                .font(.largeTitle)
                .fontWeight(.heavy)
                .foregroundColor(.primary)
                .navigationTitle("Friends")
        }
    }
}

struct History: View {
    var body: some View {
        NavigationView {
            Text("History")
                .font(.largeTitle)
                .fontWeight(.heavy)
                .foregroundColor(.primary)
                .navigationTitle("History")
        }
    }
}

struct Settings: View {
    var body: some View {
        NavigationView {
            Text("Settings")
                .font(.largeTitle)
                .fontWeight(.heavy)
                .foregroundColor(.primary)
                .navigationTitle("Settings")
        }
    }
}

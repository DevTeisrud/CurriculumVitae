//
//  ContentView.swift
//  iOS
//
//  Created by Bjørn Kristian Teisrud on 03/10/2022.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var modelData = ModelData()
    @State private var selection: Tab = .education

    enum Tab {
        case education
        case workExperience
        case volunteering
        case me
    }
    
    var body: some View {
        TabView(selection: $selection) {
            EducationsHome()
                .tabItem {
                    Label("Education", systemImage: "books.vertical")
                }
                .tag(Tab.education)

            WorkExperienceHome()
                .tabItem {
                    Label("Work Experience", systemImage: "suitcase")
                }
                .tag(Tab.workExperience)
            
            VolunteeringDetails(volunteering: modelData.volunteering[0])
                .tabItem {
                    Label("Volunteering", systemImage: "figure.wave")
                }
                .tag(Tab.volunteering)
            
            ProfilePage(profile: modelData.profile[0])
                .tabItem {
                    Label("Me", systemImage: "person")
                }
                .tag(Tab.me)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

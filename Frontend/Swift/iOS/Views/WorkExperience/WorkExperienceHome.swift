//
//  WorkExperienceHome.swift
//  CurriculumVitaeTeisrud
//
//  Created by Bjørn Kristian Teisrud on 30/08/2022.
//

import SwiftUI

struct WorkExperienceHome: View {
    @EnvironmentObject var modelData: ModelData
    @State private var listView = false
    
    var body: some View {
        NavigationView {
            if listView{
                List(){
                    WorkExperienceList()
                        .environmentObject(modelData)
                }
                .listStyle(.inset)
                .navigationTitle("WorkExperience")
                .toolbar {
                    Button {
                        listView.toggle()
                    } label: {
                        Label("rectangleView", systemImage: "rectangle.grid.1x2.fill")
                    }
                }
            } else {
                List(){
                    WorkExperienceRectangleList()
                        .environmentObject(modelData)
                }
                .navigationTitle("WorkExperience")
                .toolbar {
                    Button {
                        listView.toggle()
                    } label: {
                        Label("ListView", systemImage: "list.dash")
                    }
                }
            }
        }
    }
}

struct WorkExperienceHome_Previews: PreviewProvider {
    static let modelData = ModelData()
    
    static var previews: some View {
        WorkExperienceHome()
            .environmentObject(modelData)
    }
}

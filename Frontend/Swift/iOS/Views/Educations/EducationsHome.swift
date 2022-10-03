//
//  EducationsHome.swift
//  CurriculumVitaeTeisrud
//
//  Created by Bjørn Kristian Teisrud on 30/08/2022.
//

import SwiftUI

struct EducationsHome: View {
    @EnvironmentObject var modelData: ModelData
    @State private var listView = false
    
    var body: some View {
        NavigationView {
            if listView{
                List(){
                    EducationsList()
                        .environmentObject(modelData)
                }
                .listStyle(.inset)
                .navigationTitle("Educations")
                .toolbar {
                    Button {
                        listView.toggle()
                    } label: {
                        Label("rectangleView", systemImage: "rectangle.grid.1x2.fill")
                    }
                }
            } else {
                List(){
                    EducationsRectangleList()
                        .environmentObject(modelData)
                }
                .navigationTitle("Educations")
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

struct EducationsHome_Previews: PreviewProvider {
    static let modelData = ModelData()
    
    static var previews: some View {
        EducationsHome()
            .environmentObject(modelData)
    }
}

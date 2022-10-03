//
//  WorkExperienceRectangleList.swift
//  CurriculumVitaeTeisrud
//
//  Created by Bjørn Kristian Teisrud on 10/09/2022.
//

import SwiftUI

struct WorkExperienceRectangleList: View {
    @EnvironmentObject var modelData: ModelData
    
    var body: some View {
        Section(){
            ScrollView(showsIndicators: false) {
                ForEach(modelData.workExperience, id: \.self) { workExperience in
                    NavigationLink(destination: WorkExperienceDetails(workExperience: workExperience)) {
                        WorkExperienceRectangleListItem(workExperience: workExperience)
                    }
                }
            }
            .frame(maxWidth: .infinity)
        }
        .foregroundColor(.primary)
        .listRowInsets(EdgeInsets())
        .listRowBackground(Color.clear)
    }
}

struct WorkExperienceRectangleList_Previews: PreviewProvider {
    static let modelData = ModelData()
    
    static var previews: some View {
        WorkExperienceRectangleList()
            .environmentObject(modelData)
    }
}

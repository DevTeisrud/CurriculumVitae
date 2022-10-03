//
//  WorkExperienceList.swift
//  CurriculumVitaeTeisrud
//
//  Created by Bjørn Kristian Teisrud on 10/09/2022.
//

import SwiftUI

struct WorkExperienceList: View {
    @EnvironmentObject var modelData: ModelData
    
    var body: some View {
        ForEach(modelData.workExperience, id: \.self) { workExperience in
            NavigationLink(destination: WorkExperienceDetails(workExperience: workExperience)) {
                WorkExperienceListItem(workExperience: workExperience)
            }
        }
    }
}

struct WorkExperienceList_Previews: PreviewProvider {
    static let modelData = ModelData()
    
    static var previews: some View {
        WorkExperienceList()
            .environmentObject(modelData)
    }
}

//
//  EducationsList.swift
//  CurriculumVitaeTeisrud
//
//  Created by Bjørn Kristian Teisrud on 10/09/2022.
//

import SwiftUI

struct EducationsList: View {
    @EnvironmentObject var modelData: ModelData
    
    var body: some View {
        ForEach(modelData.educations, id: \.self) { education in
            NavigationLink(destination: EducationsDetails(education: education)) {
                EducationsListItem(educations: education)
            }
        }
    }
}

struct EducationsList_Previews: PreviewProvider {
    static let modelData = ModelData()
    
    static var previews: some View {
        EducationsList()
            .environmentObject(modelData)
    }
}

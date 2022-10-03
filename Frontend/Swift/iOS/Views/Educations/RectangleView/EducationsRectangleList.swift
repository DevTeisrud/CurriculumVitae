//
//  EducationsRectangleList.swift
//  CurriculumVitaeTeisrud
//
//  Created by Bjørn Kristian Teisrud on 10/09/2022.
//

import SwiftUI

struct EducationsRectangleList: View {
    @EnvironmentObject var modelData: ModelData
    
    var body: some View {
        Section(){
            ScrollView(showsIndicators: false) {
                ForEach(modelData.educations, id: \.self) { education in
                    NavigationLink(destination: EducationsDetails(education: education)) {
                        EducationsRectangleListItem(educations: education)
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

struct EducationsRectangleList_Previews: PreviewProvider {
    static let modelData = ModelData()
    
    static var previews: some View {
        EducationsRectangleList()
            .environmentObject(modelData)
    }
}

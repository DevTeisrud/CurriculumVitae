//
//  WorkExperienceRectangleListItem.swift
//  CurriculumVitaeTeisrud
//
//  Created by Bjørn Kristian Teisrud on 10/09/2022.
//

import SwiftUI

struct WorkExperienceRectangleListItem: View {
    var workExperience: WorkExperience
    
    var body: some View {
        VStack(spacing: 0){
            Spacer()
            HStack{
                Spacer()
                workExperience.banner
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding()
                Spacer()
            }
            Spacer()
            HStack{
                VStack(alignment: .leading){
                    Text(workExperience.role)
                        .font(.title)
                    Text(workExperience.orgName)
                        .font(.subheadline)
                }
                .padding([.leading, .bottom])
                Spacer()
            }
            .background(Color(UIColor.systemBackground))
        }
        .background(Color.white)
        .frame(height: 200)
        .cornerRadius(10)
    }
}

struct WorkExperienceRectangleListItem_Previews: PreviewProvider {
    static var previews: some View {
        WorkExperienceRectangleListItem(workExperience: ModelData().workExperience[0])
    }
}

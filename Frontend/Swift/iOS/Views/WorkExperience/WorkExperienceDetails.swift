//
//  WorkExperienceDetails.swift
//  CurriculumVitaeTeisrud
//
//  Created by Bjørn Kristian Teisrud on 30/08/2022.
//

import SwiftUI

struct WorkExperienceDetails: View {
    @EnvironmentObject var modelData: ModelData
    var workExperience: WorkExperience
    
    var body: some View {
        ScrollView {
            MapView(name: workExperience.orgName,coordinate: workExperience.locationCoordinate)
                .ignoresSafeArea(edges: .top)
                .frame(height: 300)
            
            CircleImage(image: workExperience.image, padding: workExperience.padding)
                .frame(width: 200, height: 200)
                .offset(y: -130)
                .padding(.bottom, -130)
            
            VStack(alignment: .leading) {
                Text(workExperience.role)
                    .font(.title)
                HStack{
                    Text(workExperience.orgName)
                    Spacer()
                    Text("\(workExperience.startDate) - \(workExperience.endDate)")
                }
                .font(.subheadline)
                .foregroundColor(.secondary)

                Divider()
                
                if workExperience.skills != [] {
                    Text("Skills")
                        .font(.title2)
                    ScrollView (.horizontal, showsIndicators: false) {
                         HStack {
                             ForEach(workExperience.skills, id: \.self){ skill in
                                 Skill(skill: skill)
                             }
                         }
                    }
                }

                Text("About \(workExperience.orgName)")
                    .font(.title2)
                Text(workExperience.description)
            }
            .padding()
        }
        .navigationTitle(workExperience.orgName)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct WorkExperienceDetails_Previews: PreviewProvider {
    static let modelData = ModelData()
    
    static var previews: some View {
        WorkExperienceDetails(workExperience: modelData.workExperience[0])
            .environmentObject(modelData)
    }
}

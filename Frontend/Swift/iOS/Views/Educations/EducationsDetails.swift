//
//  EducationsDetails.swift
//  CurriculumVitaeTeisrud
//
//  Created by Bjørn Kristian Teisrud on 30/08/2022.
//

import SwiftUI

struct EducationsDetails: View {
    @EnvironmentObject var modelData: ModelData
    var education: Educations
    
    var body: some View {
        ScrollView {
            MapView(name: education.orgName, coordinate: education.locationCoordinate)
                .ignoresSafeArea(edges: .top)
                .frame(height: 300)
            
            CircleImage(image: education.image, padding: true)
                .frame(width: 200, height: 200)
                .offset(y: -130)
                .padding(.bottom, -130)
            
            VStack(alignment: .leading) {
                Text(education.studyProgramme)
                    .font(.title)
                HStack{
                    Text(education.title)
                    Spacer()
                    Text("\(education.startDate) - \(education.endDate)")
                }
                .font(.subheadline)
                .foregroundColor(.secondary)

                Divider()
                
                if education.skills != [] {
                    Text("Skills")
                        .font(.title2)
                    ScrollView (.horizontal, showsIndicators: false) {
                         HStack {
                             ForEach(education.skills, id: \.self){ skill in
                                 Skill(skill: skill)
                             }
                         }
                    }
                }
                
                Text("About the study programme")
                    .font(.title2)
                Text(education.studyDescription)
                    .padding(.bottom)
                
                Text("About \(education.orgName)")
                    .font(.title2)
                Text(education.universityDescription)
                    .padding(.bottom)
            }
            .padding()
        }
        .navigationTitle(education.orgName)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct EducationsDetails_Previews: PreviewProvider {
    static let modelData = ModelData()
    
    static var previews: some View {
        EducationsDetails(education: modelData.educations[1])
            .environmentObject(modelData)
    }
}

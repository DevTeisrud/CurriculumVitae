//
//  EducationsRectangleListItem.swift
//  CurriculumVitaeTeisrud
//
//  Created by Bjørn Kristian Teisrud on 10/09/2022.
//

import SwiftUI

struct EducationsRectangleListItem: View {
    var educations: Educations
    
    var body: some View {
        VStack(spacing: 0){
            Spacer()
            HStack{
                Spacer()
                educations.image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding()
                Spacer()
            }
            Spacer()
            HStack{
                VStack(alignment: .leading){
                    Text(educations.title)
                        .font(.title)
                    Text(educations.orgName)
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

struct EducationsRectangleListItem_Previews: PreviewProvider {
    static var previews: some View {
        EducationsRectangleListItem(educations: ModelData().educations[0])
    }
}

//
//  EducationsListItem.swift
//  CurriculumVitaeTeisrud
//
//  Created by Bjørn Kristian Teisrud on 30/08/2022.
//

import SwiftUI

struct EducationsListItem: View {
    var educations: Educations
    
    var body: some View {
        HStack{
            ZStack{
                Color.white
                    .ignoresSafeArea()
                educations.image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            }
            .frame(width: 70, height: 70)
            .cornerRadius(10)
            VStack(alignment: .leading){
                Text(educations.title)
                    .font(.title)
                Text(educations.orgName)
                    .font(.subheadline)
            }
            .padding(.horizontal)
            Spacer()
        }
        .padding()
    }
}

struct EducationsListItem_Previews: PreviewProvider {
    static var previews: some View {
        EducationsListItem(educations: ModelData().educations[0])
    }
}

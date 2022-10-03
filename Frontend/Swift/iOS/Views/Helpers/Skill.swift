//
//  Skill.swift
//  CurriculumVitaeTeisrud
//
//  Created by Bjørn Kristian Teisrud on 06/09/2022.
//

import SwiftUI

struct Skill: View {
    var skill: String
    
    var body: some View {
        Text(skill)
            .padding(6)
            .background(Color(red: 0.4627, green: 0.8392, blue: 1.0))
            .cornerRadius(10)
    }
}

struct Skill_Previews: PreviewProvider {
    static var previews: some View {
        Skill(skill: "TeamBuilding")
    }
}

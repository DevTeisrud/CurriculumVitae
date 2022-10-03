//
//  CircleImage.swift
//  CurriculumVitaeTeisrud
//
//  Created by Bjørn Kristian Teisrud on 30/08/2022.
//

import SwiftUI

struct CircleImage: View {
    var image: Image
    var padding: Bool = false
    
    var body: some View {
        ZStack{
            Color.white
                .ignoresSafeArea()
            if padding{
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding()
            }else{
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            }
        }
        .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
        .overlay {
            Circle().stroke(.white, lineWidth: 4)
        }
        .shadow(radius: 7)
    }
}

struct CircleImage_Previews: PreviewProvider {
    static var previews: some View {
        CircleImage(image: Image("UiALogoShort"))
    }
}

//
//  VolunteeringDetails.swift
//  CurriculumVitaeTeisrud
//
//  Created by Bjørn Kristian Teisrud on 30/08/2022.
//

import SwiftUI
import CoreLocation

struct VolunteeringDetails: View {
    @EnvironmentObject var modelData: ModelData
    var volunteering: Volunteering
    
    var body: some View {
        ScrollView {
            MapView(name: volunteering.orgName, coordinate: volunteering.locationCoordinate)
                .ignoresSafeArea(edges: .top)
                .frame(height: 300)
            
            CircleImage(image: volunteering.image, padding: true)
                .frame(width: 200, height: 200)
                .offset(y: -130)
                .padding(.bottom, -130)
            
            VStack(alignment: .leading) {
                Text(volunteering.role)
                    .font(.title)
                
                HStack{
                    Text(volunteering.orgName)
                    Spacer()
                    Text("\(volunteering.startDate) \(volunteering.endDate)")
                }
                .font(.subheadline)
                .foregroundColor(.secondary)

                Divider()
                
                Text("My role in \(volunteering.orgName)")
                    .font(.title2)
                Text(volunteering.roleDescription)
                    .padding(.bottom)

                Text("About \(volunteering.orgName)")
                    .font(.title2)
                Text(volunteering.description)
            }
            .padding()
        }
        .navigationTitle(volunteering.orgName)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct VolunteeringDetails_Previews: PreviewProvider {
    static let modelData = ModelData()
    
    static var previews: some View {
        VolunteeringDetails(volunteering: modelData.volunteering[0])
            .environmentObject(modelData)
    }
}

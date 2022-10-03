//
//  ProfilePage.swift
//  CurriculumVitaeTeisrud
//
//  Created by Bjørn Kristian Teisrud on 30/08/2022.
//

import SwiftUI
import CoreLocation
import MapKit

struct ProfilePage: View {
    @EnvironmentObject var modelData: ModelData
    var profile: Profile
    
    var body: some View {
        ScrollView {
            ZStack(alignment: Alignment(horizontal: .trailing, vertical: .top)){
                MapView(name: profile.name, coordinate: profile.locationCoordinate)
                    .ignoresSafeArea(edges: .top)
                    .frame(height: 300)
                
                Button("Open in Maps") {
                    let destination = MKMapItem(placemark: MKPlacemark(coordinate: profile.locationCoordinate))
                    destination.name = profile.name
                    destination.openInMaps()
                }
                .padding()
            }
            
            CircleImage(image: profile.image)
                .frame(width: 200, height: 200)
                .offset(y: -130)
                .padding(.bottom, -130)
            
            VStack(alignment: .leading) {
                Text(profile.name)
                    .font(.title)
                HStack{
                    Text("Master of science Student")
                    Spacer()
                    Text("University of Agder")
                }
                .font(.subheadline)
                .foregroundColor(.secondary)

                Divider()

                Text("About me")
                    .font(.title2)
                Text(profile.description)
                
                ThreeWords(profile: profile)
            }
            .padding()
        }
        .navigationTitle("ProfilePage")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct ProfilePage_Previews: PreviewProvider {
    static let modelData = ModelData()
    
    static var previews: some View {
        ProfilePage(profile: modelData.profile[0])
            .environmentObject(modelData)
    }
}

struct ThreeWords: View {
    var profile: Profile
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Described in three words:")
                .font(.title2)
            Text("Ambitious")
                .font(.title3)
            Text(profile.threeWords.ambitious)
                .padding(.leading)
            Text("Precise")
                .font(.title3)
            Text(profile.threeWords.precise)
                .padding(.leading)
            Text("Teambuilder")
                .font(.title3)
            Text(profile.threeWords.teambuilder)
                .padding(.leading)
        }
        .padding(.vertical)
    }
}

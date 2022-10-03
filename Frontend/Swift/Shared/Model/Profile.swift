//
//  Profile.swift
//  CurriculumVitae
//
//  Created by Bjørn Kristian Teisrud on 30/08/2022.
//

import Foundation
import SwiftUI
import CoreLocation

struct Profile: Hashable, Codable, Identifiable {
    var id: Int
    var name: String
    var description: String

    private var imageName: String
    var image: Image {
        Image(imageName)
    }

    private var coordinates: Coordinates
    var locationCoordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(
            latitude: coordinates.latitude,
            longitude: coordinates.longitude)
    }

    struct Coordinates: Hashable, Codable {
        var latitude: Double
        var longitude: Double
    }
    
    var threeWords: ThreeWords
    struct ThreeWords: Hashable, Codable {
        var ambitious: String
        var precise: String
        var teambuilder: String
    }
}

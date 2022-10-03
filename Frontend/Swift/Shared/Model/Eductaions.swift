//
//  Eductaions.swift
//  CurriculumVitae
//
//  Created by Bjørn Kristian Teisrud on 30/08/2022.
//

import Foundation
import SwiftUI
import CoreLocation

struct Educations: Hashable, Codable, Identifiable {
    var id: Int
    var orgName: String
    var title: String
    var studyProgramme: String
    var geoLocation: String
    var startDate: String
    var endDate: String
    var universityDescription: String
    var studyDescription: String
    var skills: [String]

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
}

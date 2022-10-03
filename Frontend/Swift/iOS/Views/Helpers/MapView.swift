//
//  MapView.swift
//  CurriculumVitaeTeisrud
//
//  Created by Bjørn Kristian Teisrud on 30/08/2022.
//

import SwiftUI
import MapKit

struct MapView: View {
    var name: String
    var coordinate: CLLocationCoordinate2D
    var locations : [Location] {
            get {
             return [Location(name: name, coordinate: coordinate)]
            }
        }

    @AppStorage("MapView.zoom")
    private var zoom: Zoom = .medium

    enum Zoom: String, CaseIterable, Identifiable {
        case near = "Near"
        case medium = "Medium"
        case far = "Far"

        var id: Zoom {
            return self
        }
    }

    var delta: CLLocationDegrees {
        switch zoom {
        case .near: return 0.02
        case .medium: return 0.2
        case .far: return 2
        }
    }
    
    struct Location: Identifiable {
        let id = UUID()
        let name: String
        let coordinate: CLLocationCoordinate2D
    }

    var body: some View {
        Map(coordinateRegion: .constant(region), annotationItems: locations){ location in
            MapMarker(coordinate: location.coordinate)
        }
    }

    var region: MKCoordinateRegion {
        MKCoordinateRegion(
            center: coordinate,
            span: MKCoordinateSpan(latitudeDelta: delta, longitudeDelta: delta)
        )
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView(name: "Test",coordinate: CLLocationCoordinate2D(latitude: 58.13635, longitude: 7.99771))
    }
}

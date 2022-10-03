//
//  ModelData.swift
//  CurriculumVitae
//
//  Created by Bjørn Kristian Teisrud on 30/08/2022.
//

import Foundation
import Combine

final class ModelData: ObservableObject {
    @Published var educations: [Educations] = load("educations.json")
    @Published var workExperience: [WorkExperience] = load("workExperience.json")
    @Published var volunteering: [Volunteering] = load("volunteering.json")
    @Published var profile: [Profile] = load("profile.json")
}

func load<T: Decodable>(_ filename: String) -> T {
    let data: Data

    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
        else {
            fatalError("Couldn't find \(filename) in main bundle.")
    }

    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }

    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}

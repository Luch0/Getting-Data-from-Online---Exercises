//
//  Film.swift
//  GettingDatFromOnlineExercises
//
//  Created by Luis Calle on 11/27/17.
//  Copyright © 2017 Luis Calle. All rights reserved.
//

import Foundation

struct Film: Codable {
    let id: String
    let title: String
    let description: String
    let director: String
    let producer: String
    let release_date: String
    let rt_score: String
    let people: [String]
    let species: [String]
    let locations: [String]
    let vehicles: [String]
    let url: String
}

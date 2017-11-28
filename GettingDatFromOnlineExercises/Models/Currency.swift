//
//  Currency.swift
//  GettingDatFromOnlineExercises
//
//  Created by Luis Calle on 11/27/17.
//  Copyright © 2017 Luis Calle. All rights reserved.
//

import Foundation

struct Currency: Codable {
    let base: String
    let rates: [String:Double]
}

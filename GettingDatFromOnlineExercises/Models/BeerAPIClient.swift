//
//  BeerAPIClient.swift
//  GettingDatFromOnlineExercises
//
//  Created by Luis Calle on 11/27/17.
//  Copyright © 2017 Luis Calle. All rights reserved.
//

import Foundation

class BeerAPIClient {
    private init() {}
    static let manager = BeerAPIClient()
    func getBeers(from urlStr: String,
                  completionHandler: @escaping ([Beer]) -> Void,
                  errorHandler: @escaping (Error) -> Void) {
        guard let url = URL(string: urlStr) else { return }
        let completion: (Data) -> Void = {(data: Data) in
            do {
                let decoder = JSONDecoder()
                let beers = try decoder.decode([Beer].self, from: data)
                completionHandler(beers)
            }
            catch let error {
                errorHandler(error)
            }
        }
        NetworkHelper.manager.performDataTask(with: url, completionHandler: completion, errorHandler: errorHandler)
    }
}

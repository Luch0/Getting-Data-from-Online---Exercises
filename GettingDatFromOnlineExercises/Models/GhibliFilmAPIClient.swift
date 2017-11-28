//
//  GhibliFilmAPIClient.swift
//  GettingDatFromOnlineExercises
//
//  Created by Luis Calle on 11/27/17.
//  Copyright © 2017 Luis Calle. All rights reserved.
//

import Foundation

class GhibliFilmAPIClient {
    private init() {}
    static let manager = GhibliFilmAPIClient()
    func getFilms(from urlStr: String,
                     completionHandler: @escaping ([Film]) -> Void,
                     errorHandler: @escaping (Error) -> Void) {
        guard let url = URL(string: urlStr) else { return }
        let completion: (Data) -> Void = {(data: Data) in
            do {
                let decoder = JSONDecoder()
                let films = try decoder.decode([Film].self, from: data)
                completionHandler(films)
            }
            catch let error {
                errorHandler(error)
            }
        }
        NetworkHelper.manager.performDataTask(with: url, completionHandler: completion, errorHandler: errorHandler)
    }
}

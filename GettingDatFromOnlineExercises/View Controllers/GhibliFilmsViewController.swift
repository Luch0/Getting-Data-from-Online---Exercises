//
//  GhibliFilmsViewController.swift
//  GettingDatFromOnlineExercises
//
//  Created by Luis Calle on 11/27/17.
//  Copyright © 2017 Luis Calle. All rights reserved.
//

import UIKit

class GhibliFilmsViewController: UIViewController, UITableViewDelegate {
    
    var allFilms = [Film]()
    
    @IBOutlet weak var filmsTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.filmsTableView.delegate = self
        self.filmsTableView.dataSource = self
        loadData()
    }
    
    func loadData() {
        let urlStr = "https://ghibliapi.herokuapp.com/films"
        let setFilmsToOnlineFilms: ([Film]) -> Void = {(onlineFilms: [Film]) in
            self.allFilms = onlineFilms
            self.filmsTableView.reloadData()
        }
        GhibliFilmAPIClient.manager.getFilms(from: urlStr,
                                        completionHandler: setFilmsToOnlineFilms,
                                        errorHandler: {print($0)})
    }
    

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? DetailedGhibliFilmsViewController {
            destination.film = self.allFilms[(self.filmsTableView.indexPathForSelectedRow?.row)!]
        }
    }

}

extension GhibliFilmsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allFilms.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let filmCell = tableView.dequeueReusableCell(withIdentifier: "Film Cell", for: indexPath)
        let selectedFilm = allFilms[indexPath.row]
        filmCell.textLabel?.text = selectedFilm.title
        filmCell.detailTextLabel?.text = selectedFilm.release_date
        return filmCell
    }
    
    
}

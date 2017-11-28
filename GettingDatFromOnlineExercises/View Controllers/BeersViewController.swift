//
//  BeersViewController.swift
//  GettingDatFromOnlineExercises
//
//  Created by Luis Calle on 11/27/17.
//  Copyright © 2017 Luis Calle. All rights reserved.
//

import UIKit

class BeersViewController: UIViewController {

    var allBeers = [Beer]()
    @IBOutlet weak var beersTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.beersTableView.delegate = self
        self.beersTableView.dataSource = self
        loadData()
    }

    func loadData() {
            let urlStr = "https://api.punkapi.com/v2/beers"
            let completion: ([Beer]) -> Void = {(beers: [Beer]) in
                self.allBeers = beers
                self.beersTableView.reloadData()
            }
            BeerAPIClient.manager.getBeers(from: urlStr,
                                                 completionHandler: completion,
                                                 errorHandler: {print($0)})
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? DetailedBeerViewController {
            destination.beer = self.allBeers[(self.beersTableView.indexPathForSelectedRow?.row)!]
        }
    }

}

extension BeersViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allBeers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let beerCell = tableView.dequeueReusableCell(withIdentifier: "Beer Cell", for: indexPath)
        let selectedBeer = allBeers[indexPath.row]
        beerCell.textLabel?.text = selectedBeer.name
        beerCell.detailTextLabel?.text = selectedBeer.first_brewed
        return beerCell
    }
}

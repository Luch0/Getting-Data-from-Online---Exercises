//
//  DetailedBeerViewController.swift
//  GettingDatFromOnlineExercises
//
//  Created by Luis Calle on 11/27/17.
//  Copyright © 2017 Luis Calle. All rights reserved.
//

import UIKit

class DetailedBeerViewController: UIViewController {

    @IBOutlet weak var brewerTipsLabel: UILabel!
    @IBOutlet weak var firstBrewedLabel: UILabel!
    @IBOutlet weak var beerTaglineLabel: UILabel!
    @IBOutlet weak var beerNameLabel: UILabel!
    @IBOutlet weak var descriptionTextView: UITextView!
    var beer: Beer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let beer = beer else { return }
        beerNameLabel.text = beer.name
        beerTaglineLabel.text = beer.tagline
        firstBrewedLabel.text = beer.first_brewed
        brewerTipsLabel.text = beer.brewers_tips
        descriptionTextView.text = beer.description
    }

}

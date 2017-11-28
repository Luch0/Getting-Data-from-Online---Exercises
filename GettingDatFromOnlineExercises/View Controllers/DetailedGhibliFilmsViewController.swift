//
//  DetailedGhibliFilmsViewController.swift
//  GettingDatFromOnlineExercises
//
//  Created by Luis Calle on 11/27/17.
//  Copyright © 2017 Luis Calle. All rights reserved.
//

import UIKit

class DetailedGhibliFilmsViewController: UIViewController {

    var film: Film?
    @IBOutlet weak var directorLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var producerLabel: UILabel!
    @IBOutlet weak var releaseDateLabel: UILabel!
    @IBOutlet weak var rtScoreLabel: UILabel!
    
    @IBOutlet weak var descriptionTextView: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let film = film else { return }
        directorLabel.text = "Director: \(film.director)"
        titleLabel.text = "\(film.title)"
        producerLabel.text = "Producer: \(film.producer)"
        releaseDateLabel.text = "Release Date: \(film.release_date)"
        rtScoreLabel.text = "RT Score: \(film.rt_score)"
        descriptionTextView.text = film.description
    }

}

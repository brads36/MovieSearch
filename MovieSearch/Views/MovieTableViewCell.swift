//
//  MovieTableViewCell.swift
//  MovieSearch
//
//  Created by Bryce Bradshaw on 5/1/20.
//  Copyright © 2020 Bryce Bradshaw. All rights reserved.
//

import UIKit

class MovieTableViewCell: UITableViewCell {

    // MARK: - Outlets
    @IBOutlet weak var movieImageView: UIImageView!
    @IBOutlet weak var movieTitleLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var overviewLabel: UILabel!
    
    // MARK: - Properties
    var movie: Movie? {
        didSet {
            updateViewsWithMovie()
        }
    }
    
    func updateViewsWithMovie() {
        if let id = movie?.id {
            MovieController.fetchImageWith(movieId: id) { (result) in
                DispatchQueue.main.async {
                    switch result {
                    case .success(let image):
                        self.movieImageView.image = image
                    case .failure(let error):
                        print(error.errorDescription ?? "Looks like we have an error")
                    }
                    self.movieTitleLabel.text = self.movie?.title
                    //self.ratingLabel.text = self.movie?.rating
                    self.overviewLabel.text = self.movie?.overview
                }
            }
        }
    }
}

//
//  Movie.swift
//  MovieLib
//
//  Created by Giuliano Accorsi on 02/09/22.
//

import Foundation

struct Movie: Decodable {
    let title, movieCategories, duration, movieSummary, image: String
    let rating: Double
}

//
//  MovieList.swift
//  MovieLib
//
//  Created by Giuliano Accorsi on 02/09/22.
//

import Foundation
import UIKit

class MoviesListViewController: UITableViewController {

    var movies: [Movie] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        loadMovies()
    }


    private func loadMovies() {
        guard let jsonURL = Bundle.main.url(forResource: "movies", withExtension: "json") else { return }
        do {
            let data = try Data(contentsOf: jsonURL)
            // Utiliza Movie.self -> Estamos querendo o Tipo da Classe, e é acessado através do self
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            movies = try decoder.decode([Movie].self, from: data)
        } catch {
            print(error)
        }
    }
}

extension MoviesListViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = movies[indexPath.row].title
        let nota = movies[indexPath.row].rating
        cell.detailTextLabel?.text = "\(nota) ⭐️"
        return cell
    }
}

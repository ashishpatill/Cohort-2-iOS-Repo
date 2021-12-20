//
//  ViewController.swift
//  Movie Api demo
//
//  Created by Ashish Pisey on 19/12/21.
//

import UIKit

class ViewController: UIViewController {
    let movieApi = "https://swapi.py4e.com/api/people/"
    
    let identifier = "PeopleCell"
    
    @IBOutlet weak var tableView: UITableView!
    var movie: Movie?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.dataSource = self
        getMovieApi()
    }
    
    func getMovieApi() {
        ApiManager.getApiResponse(urlPath: movieApi) { data, error in
            if error != nil {
                print(error?.localizedDescription)
            } else {
                if let data = data {
                    self.movie = self.parseLogic(data: data)
                    DispatchQueue.main.async {
                        // main thread
                        self.tableView.reloadData()
                    }
                }
            }
        }
    }
    
    private func parseLogic(data:Data) -> Movie? {
        do {
            let movie = try JSONDecoder().decode(Movie.self, from: data)
            print(movie.results.first!.name)
            return movie
        } catch {
            print(error.localizedDescription)
            return nil
        }
    }
}



extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.movie?.results.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath)
        cell.textLabel?.text = self.movie?.results[indexPath.row].name
        return cell
    }
}


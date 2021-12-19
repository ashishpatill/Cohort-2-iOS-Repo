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
    var movieArr: [MovieCharacter] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.dataSource = self
        getMovieApi()
    }
    
    func getMovieApi() {
        let urlSession = URLSession.shared
        guard let moviesUrl = URL.init(string: movieApi) else { return }
        
        print("1. before api call")
        let task = urlSession.dataTask(with: moviesUrl) { data, response, error in
            print("2. during an api call")
            if error != nil {
                print("error: \(String(describing: error?.localizedDescription))")
            } else {
                self.parseLogic(data: data!)
            }
        }
        
        task.resume()
        
        print("3. after api call")
    }
    
    func parseLogic(data:Data) {
        do {
            let dict = try JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]
            //print(dict)
            if let results = dict["results"] as? [[String:Any]]   { // Important
                for result in results {
                    parseMoviesApi(dict: result)
                }
            }
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func parseMoviesApi(dict : [String:Any]) {
        guard let name = dict["name"] as? String,  // Important
              let birthYear = dict["birth_year"] as? String,
              let films = dict["films"] as? [String],
              let species = dict["species"] as? [String] else {
                  print("parsing failed")
                  return
              }
        
        let movieCharacter = MovieCharacter.init(name: name, birthYear: birthYear, films: films, species: species)
        movieArr.append(movieCharacter)
        print(movieCharacter)
    }

}

struct MovieCharacter {
    let name : String
    let birthYear : String
    let films : [String]
    let species : [String]
}


extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movieArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath)
        cell.textLabel?.text = movieArr[indexPath.row].name
        return cell
    }
}


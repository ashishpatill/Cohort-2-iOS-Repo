//
//  ViewController.swift
//  vapor client demo
//
//  Created by Ashish Pisey on 27/12/21.
//

import UIKit
import Alamofire

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var movies:[String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.dataSource = self
        
        //getMovies()
        //getMoviesWithAlamofire()
        getPhotos()
    }
    
    //MARK: - POST
    func getMovies() {
        
        let movieObj = MovieRequest.init(category: "action")

        guard let url = URL.init(string: "http://127.0.0.1:8080/movies/") else { return }
        
        let urlSession = URLSession.shared
        
        var request = URLRequest.init(url: url)
        request.httpMethod = "POST"
        
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        request.httpBody = try! JSONEncoder().encode(movieObj)
        
        print("1. before api call")
        
        let task = urlSession.dataTask(with: request) { data, response, error in
            print("2. during an api call")
            if error != nil {
                print("error: \(String(describing: error?.localizedDescription))")
                //completionHandler(nil, error)
            } else {
                guard let data = data else {
                    return
                }

                let response = try! JSONDecoder().decode(MovieResponse.self, from: data)
                self.movies = response.movies
                print("status: \(response.status)")
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
                //completionHandler(data, nil)
            }
        }
        
        task.resume()
    }
    
    //MARK: - POST Api with Alamofire
    func getMoviesWithAlamofire() {
        let movieObj = MovieRequest.init(category: "action")
        
        AF.request("http://127.0.0.1:8080/movies/",
                   method: .post,
                   parameters: movieObj).responseDecodable(of: MovieResponse.self) { response in
            guard let movieResponse = response.value else { return }
            self.movies = movieResponse.movies
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    //MARK: - GET Api
    func getPhotos() {
        let photoURL = "https://jsonplaceholder.typicode.com/photos"
        
        AF.request(photoURL).responseDecodable(of: [Photo].self) { response in
            guard let photoArr = response.value else { return }
            
            self.movies = photoArr.map{ photoObj in
                print("convert photo object to string")
                return "title: " + photoObj.title
            }
            
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
}

struct MovieRequest: Codable {
    let category: String
}

struct MovieResponse: Codable {
    let status: Int
    let movies: [String]
}

struct Photo : Codable {
    let title: String
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell =  tableView.dequeueReusableCell(withIdentifier: "MovieCell", for: indexPath)
        cell.textLabel?.text = movies[indexPath.row]
        return cell
    }
}


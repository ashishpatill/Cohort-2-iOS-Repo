//
//  ViewController.swift
//  Local notifications assignment
//
//  Created by Ashish Pisey on 19/12/21.
//

import UIKit

class ViewController: UIViewController {
    var people = [MovieCharacter]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let fileURL = Bundle.main.url(forResource: "movies", withExtension: "json")
        do {
            let moviesData = try Data.init(contentsOf: fileURL!)
            let data = moviesData as! Data
            do {
                let dict = try JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]
                //print(dict)
                if let results = dict["results"] as? [[String:Any]] {
                    for result in results {
                        parseMoviesApi(dict: result)
                    }
                }
            } catch {
                print(error.localizedDescription)
            }
        } catch {
            print("Parse error")
        }
        
    }
    
    func parseMoviesApi(dict : [String:Any]) {
        guard let name = dict["name"] as? String,
              let birthYear = dict["birth_year"] as? String,
              let films = dict["films"] as? [String],
              let species = dict["species"] as? [String],
              let heightStr = dict["height"] as? String,
              let height = Int(heightStr) else {
                  print("parsing failed")
                  return
              }
        
        let movieCharacter = MovieCharacter.init(name: name, birthYear: birthYear, films: films, species: species, height: height)
        self.people.append(movieCharacter)
        print("before sort: \(self.people)")
        self.people.sort(by:<)
        print("after sort: \(self.people)")
    }
}

struct MovieCharacter: Comparable {
    static func < (lhs: MovieCharacter, rhs: MovieCharacter) -> Bool {
        lhs.height < rhs.height
    }
    
    let name : String
    let birthYear : String
    let films : [String]
    let species : [String]
    let height : Int
}

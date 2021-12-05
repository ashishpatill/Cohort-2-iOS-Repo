//
//  ViewController.swift
//  Fifa Rankings
//
//  Created by Ashish Pisey on 05/12/21.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, RankingsProtocol {
    let identifier = "rankingCell"
    
    @IBOutlet weak var rankingsTableView: UITableView!
    var rankingsArr: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        rankingsArr = ["Real Madrid", "Barcelona", "Liverpool", "Man City", "Manchester United"]
        rankingsTableView.dataSource = self // Important
    }
    
    // UITableview data source methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return rankingsArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as! RankingCell // Important
        let teamName = rankingsArr[indexPath.row]
        cell.teamName?.text = teamName
        cell.rankingScore.text = "123"
        return cell
    }
    
    func passTeamData(teamName: String) {
        
    }
    
    // Not important for today
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let detailVC = segue.destination as? DetailVC
        if segue.identifier == "RankingDetail"  { // Important
            // pass data to detail VC
            detailVC?.teamName = "Man City"
        }
    }
}

protocol RankingsProtocol {
    func passTeamData(teamName: String)
}

// View controller to Detail VC
// Property

// From DetailVC to View Controller (to retain cycle)
//protocol

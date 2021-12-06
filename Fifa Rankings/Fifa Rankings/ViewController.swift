//
//  ViewController.swift
//  Fifa Rankings
//
//  Created by Ashish Pisey on 05/12/21.
//

import UIKit

class ViewController: UIViewController, RankingsProtocol {
    @IBOutlet weak var rankingsTableView: UITableView!
    var rankingsArr: [String] = ["Real Madrid", "Barcelona", "Liverpool", "Man City", "Manchester United"]
    let cellIdentifier = "RankingCell"
    var teamName = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        rankingsTableView.dataSource = self // Important
        rankingsTableView.delegate = self
    }
    
    func passTeamData(teamName: String) {
        
    }
    
    // Not important for today
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        print("prepare for segue called")
        
        let detailVC = segue.destination as? DetailVC
        if segue.identifier == "RankingDetail"  { // Important
            // pass data to detail VC
            detailVC?.teamName = teamName
        }
    }
    
    @IBAction func addMoreData(_ sender: UIButton) {
        rankingsArr.append("Team name")
        rankingsTableView.reloadData()
    }
}

protocol RankingsProtocol {
    func passTeamData(teamName: String)
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    // UITableview data source methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return rankingsArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print("Cell for row")
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! RankingCell // Important
        let teamName = rankingsArr[indexPath.row]
        cell.teamNameLabel?.text = teamName
        cell.rankingScoreLabel?.text = "123"
        cell.teamIcon?.image = UIImage.init(systemName: "person")
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        teamName = rankingsArr[indexPath.row]
        print("Clicked on: \(teamName)")
        self.performSegue(withIdentifier: "RankingDetail", sender: nil)
    }
}

// View controller to Detail VC
// Property

// From DetailVC to View Controller (to retain cycle)
//protocol

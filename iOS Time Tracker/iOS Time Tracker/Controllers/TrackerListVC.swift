//
//  ViewController.swift
//  iOS Time Tracker
//
//  Created by Ashish Pisey on 21/12/21.
//

import UIKit

class TrackerListVC: UIViewController {
    let cellId = "TrackerCell"
    
    @IBOutlet weak var tblTrackerList: UITableView!
    var trackerListArr: [Tracker] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tblTrackerList.dataSource = self
        tblTrackerList.delegate = self
    }
    
    @IBAction func goToAddTrackerScreen(_ sender: UIBarButtonItem) {
        let addTrackerVC = storyboard?.instantiateViewController(withIdentifier: "AddTrackerVC") as! AddTrackerVC
        addTrackerVC.delegate = self
        self.navigationController?.pushViewController(addTrackerVC, animated: true)
    }
}

extension TrackerListVC: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return trackerListArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath)
        let tracker = trackerListArr[indexPath.row]
        cell.textLabel?.text = tracker.topicName
        cell.detailTextLabel?.text = tracker.timerDisplayValue
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let trackerVC = storyboard?.instantiateViewController(withIdentifier: "TrackerVC") as! TrackerVC
        trackerVC.tracker = trackerListArr[indexPath.row]
        trackerVC.delegate = self
        self.navigationController?.pushViewController(trackerVC, animated: true)
    }
}

extension TrackerListVC: TrackerDelegate {
    func addTrackerToList(tracker: Tracker) {
        trackerListArr.append(tracker)
        tblTrackerList.reloadData()
    }
    
    func removeTrackerfromList(tracker: Tracker) {
        trackerListArr = trackerListArr.filter{ $0.topicName != tracker.topicName }
        tblTrackerList.reloadData()
    }
}


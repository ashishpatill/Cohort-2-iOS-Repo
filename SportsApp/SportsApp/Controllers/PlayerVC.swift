//
//  PlayerVC.swift
//  SportsApp
//
//  Created by Ashish Pisey on 29/12/21.
//

import UIKit

class PlayerVC: UIViewController {
    var teamItem: TeamItem?
    @IBOutlet weak var tblPlayer: UITableView!
    var alert:UIAlertController!
    var editingPlayerItem: PlayerItem?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "\(teamItem?.name ?? "") players"
        
        tblPlayer.dataSource = self
        tblPlayer.delegate = self
    
        tblPlayer.reloadData()
    }

    @IBAction func addPlayer(_ sender: UIBarButtonItem) {
        alert = UIAlertController.init(title: "Add a team", message: "", preferredStyle: .alert)
        
        // set name textfield
        alert.addTextField { tf in
            if let playerName = self.editingPlayerItem?.name {
                tf.text = playerName
            }
            tf.placeholder = "Enter player name"
        }
        // set height textfield
        alert.addTextField { tf in
            if let playerHeight = self.editingPlayerItem?.height {
                tf.text = "\(playerHeight)"
            }
            tf.placeholder = "Enter height in inches"
            tf.keyboardType = .numberPad
        }
        // set age textfield
        alert.addTextField { tf in
            if let playerAge = self.editingPlayerItem?.age {
                tf.text = "\(playerAge)"
            }
            tf.placeholder = "Enter age"
        }
        
        let nameTf = alert.textFields?[0]
        let heightTf = alert.textFields?[1]
        let ageTf = alert.textFields?[2]
        
        nameTf?.delegate = self
        
        // Set save action title
        var saveActionTitle = "Save"
        if editingPlayerItem != nil {
            saveActionTitle = "Update"
        }
        
        // save action
        let saveAction = UIAlertAction.init(title: saveActionTitle, style: .default, handler: { saveAction in
            if let playerName = nameTf?.text {
                
                let height = Double(heightTf?.text ?? "0") ?? 0
                let age = Int16(ageTf?.text ?? "0") ?? 0
                
                if let editingPlayerItem = self.editingPlayerItem,
                   let playerArr = self.teamItem?.player?.allObjects as? [PlayerItem] {
                    // update existing player
                    editingPlayerItem.name = playerName
                    editingPlayerItem.age = age
                    editingPlayerItem.height = height
                    self.updatePlayerItem(playerArr: playerArr, editingPlayerItem: editingPlayerItem)
                } else {
                    // Add new player item
                    let (updatedTeamItem, error) = CoreDataManager.shared.addPlayerToTeam(playerName: playerName, age: age, height: height, team: self.teamItem!)
                    self.reloadPlayerData(updatedTeamItem: updatedTeamItem, error: error)
                }
                
            }
        })
        // enable/disable save action
        saveAction.isEnabled = (nameTf?.text?.count ?? 0) > 0
        alert.addAction(saveAction)
        
        self.present(alert, animated: true, completion: nil)
    }
    
    // Update existing player data in database
    func updatePlayerItem(playerArr:[PlayerItem], editingPlayerItem: PlayerItem) {
        var playerArr = playerArr
        // Update player item
        if let playerItemIndex = playerArr.firstIndex(where: {$0.id == editingPlayerItem.id}) {
            playerArr[playerItemIndex] = editingPlayerItem
        }
        self.teamItem?.player = NSSet.init(array: playerArr)
        let error = CoreDataManager.shared.saveContext()
        self.reloadPlayerData(updatedTeamItem: self.teamItem, error: error)
    }
    
    func reloadPlayerData(updatedTeamItem:TeamItem?, error:Error?) {
        if let error = error {
            self.showError(error: error)
        } else {
            self.teamItem = updatedTeamItem
            self.tblPlayer.reloadData()
        }
    }
    
}

extension PlayerVC: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return teamItem?.player?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: PlayerCell.self)) as! PlayerCell
        if let playerArr = teamItem?.player?.allObjects as? [PlayerItem] {
           let player = playerArr[indexPath.row]
            cell.configureCell(playerItem: player)
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if let playerArr = teamItem?.player?.allObjects as? [PlayerItem] {
           let player = playerArr[indexPath.row]
            CoreDataManager.shared.deletePlayer(player: player)
            if let teamItem = teamItem {
               let (updatedTeamItem, error) = CoreDataManager.shared.fetchPlayers(for: teamItem)
               self.reloadPlayerData(updatedTeamItem: updatedTeamItem, error: error)
            }
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let playerArr = teamItem?.player?.allObjects as? [PlayerItem] {
            editingPlayerItem = playerArr[indexPath.row]
            self.addPlayer(UIBarButtonItem())
        }
    }
}

extension PlayerVC: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        let isTextPresent = textField.text!.count > 1 || string.count > 0
        
        let saveAction = alert.actions[0]
        saveAction.isEnabled = isTextPresent
    
        return true
    }
}

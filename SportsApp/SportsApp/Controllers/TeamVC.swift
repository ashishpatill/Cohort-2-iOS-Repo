//
//  ViewController.swift
//  SportsApp
//
//  Created by Ashish Pisey on 29/12/21.
//

import UIKit

class TeamVC: UIViewController, UINavigationControllerDelegate {

    @IBOutlet weak var tblTeam: UITableView!
    var teamList:[TeamItem] = []
    var alert:UIAlertController!
    var tempImage:UIImage?
    var isEditingItem: Bool = false
    var editingTeamItem: TeamItem?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tempImage = UIImage.init(systemName: "sportscourt")
        
        tblTeam.dataSource = self
        tblTeam.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        fetchAllTeams()
    }
    
    func fetchAllTeams() {
        let (teamArr,error) = CoreDataManager.shared.fetchTeams()
        
        if let error = error {
            showError(error: error)
        } else {
            if let teamArr = teamArr,
               teamArr.count > 0 {
                teamList = teamArr
                tblTeam.reloadData()
            }
        }
    }

    @IBAction func addTeam(_ sender: UIBarButtonItem) {
        alert = UIAlertController.init(title: "Add a team", message: "", preferredStyle: .alert)
        
        alert.addTextField { tf in
            tf.placeholder = "Enter team name"
        }
                
        // Image Action
        let addImageAction = UIAlertAction.init(title: "Add Team Icon", style: .default, handler: { addImageAction in
            self.getImageFromGallery()
        })
        var teamImage = tempImage?.imageResized(to: CGSize.init(width: 50, height: 30))
        teamImage = teamImage?.withRenderingMode(.alwaysOriginal)
        addImageAction.setValue(teamImage, forKey: "image")
        alert.addAction(addImageAction)
        
        // Save Action
        let tf = self.alert.textFields?[0]
        tf?.delegate = self
        let saveAction = UIAlertAction.init(title: "Save", style: .default, handler: { saveAction in
            if let teamName = tf?.text {
                self.saveTeamItem(teamName: teamName, playerArr: nil)
            }
        })
        // enable/disable save action
        saveAction.isEnabled = false
        alert.addAction(saveAction)
        
        self.present(alert, animated: true, completion: nil)
    }
    
    //MARK: - Save new team item
    func saveTeamItem(teamName:String, playerArr: [PlayerItem]?) {
        let imageData = self.tempImage?.jpegData(compressionQuality: 0.5)
        let (_,_) = CoreDataManager.shared.saveTeam(name: teamName, teamIcon: imageData, player: playerArr)
        fetchAllTeams()
        self.tempImage = nil
    }
    
    @objc func btnUpdateClicked(sender:UIButton) {
        isEditingItem = true
        editingTeamItem = teamList[sender.tag]
        self.getImageFromGallery()
    }
}

extension TeamVC: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return teamList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: TeamCell.self)) as! TeamCell
        cell.lblTeamName.text = teamList[indexPath.row].name
        
        if let iconData = teamList[indexPath.row].icon {
            cell.btnTeamIcon.setImage(UIImage(data: iconData), for: .normal) 
        }
        // to identify which button was clicked
        cell.btnTeamIcon.tag = indexPath.row
        cell.btnTeamIcon.addTarget(self, action: #selector(btnUpdateClicked(sender:)), for: .touchUpInside)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let playerVC = storyboard?.instantiateViewController(withIdentifier: String(describing: PlayerVC.self)) as! PlayerVC
        playerVC.teamItem = teamList[indexPath.row]
        navigationController?.pushViewController(playerVC, animated: true)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        let teamItem = teamList[indexPath.row]
        CoreDataManager.shared.deleteTeam(team: teamItem)
        fetchAllTeams()
    }
}

extension TeamVC : UIImagePickerControllerDelegate {
    func getImageFromGallery() {
        if UIImagePickerController.isSourceTypeAvailable(.savedPhotosAlbum){
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.sourceType = .savedPhotosAlbum
            imagePicker.allowsEditing = false

            present(imagePicker, animated: true, completion: nil)
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        tempImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage
        
        picker.dismiss(animated: true) {
            if self.isEditingItem == false {
                //creating new item
                self.addTeam(UIBarButtonItem())
            } else {
                if let iconData = self.tempImage?.jpegData(compressionQuality: 0.5),
                    let editingItem = self.editingTeamItem {
                    // editing item image
                    editingItem.icon = iconData
                    // update editing team item in database
                    if let error = CoreDataManager.shared.updateTeam(editingTeamItem: editingItem) {
                        self.showError(error: error)
                    } else {
                        // fetch updated team items
                        self.fetchAllTeams()
                    }
                }
            }
        }
    }
}

extension TeamVC: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        let isTextPresent = textField.text!.count > 2 || string.count > 0
        
        let saveAction = alert.actions[1]
        saveAction.isEnabled = isTextPresent
    
        return true
    }
}


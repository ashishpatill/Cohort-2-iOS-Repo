//
//  TeamCell.swift
//  SportsApp
//
//  Created by Ashish Pisey on 29/12/21.
//

import UIKit

class TeamCell: UITableViewCell {

    @IBOutlet weak var parentStackView: UIStackView!
    @IBOutlet weak var btnTeamIcon: UIButton!
    @IBOutlet weak var lblTeamName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.parentStackView.layer.cornerRadius = 8
        self.parentStackView.layer.masksToBounds = true
        
        self.parentStackView.layer.shadowColor = UIColor.darkGray.cgColor
        self.parentStackView.layer.shadowOpacity = 0.4
        self.parentStackView.layer.shadowRadius = 4
        
        self.btnTeamIcon.layer.cornerRadius = self.btnTeamIcon.frame.width/2
        self.btnTeamIcon.layer.masksToBounds = true
        
        self.btnTeamIcon.layer.borderWidth = 3.0
        self.btnTeamIcon.layer.borderColor = UIColor.lightGray.cgColor
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

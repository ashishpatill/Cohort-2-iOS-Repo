//
//  PlayerCell.swift
//  SportsApp
//
//  Created by Ashish Pisey on 29/12/21.
//

import UIKit

class PlayerCell: UITableViewCell {

    @IBOutlet weak var lblPlayerName: UILabel!
    @IBOutlet weak var lblHeight: UILabel!
    @IBOutlet weak var lblAge: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configureCell(playerItem:PlayerItem) {
        self.lblPlayerName.text = playerItem.name
        self.lblHeight.text = "\(playerItem.height)"
        self.lblAge.text = "\(playerItem.age)"
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

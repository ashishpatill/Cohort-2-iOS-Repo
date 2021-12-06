//
//  RankingCell.swift
//  Fifa Rankings
//
//  Created by Ashish Pisey on 06/12/21.
//

import UIKit

class RankingCell: UITableViewCell {

    @IBOutlet weak var teamNameLabel: UILabel!
    @IBOutlet weak var rankingScoreLabel: UILabel!
    @IBOutlet weak var teamIcon: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

//
//  WeekTableViewCell.swift
//  MyTimeVisualizer
//
//  Created by admin on 20/12/2021.
//

import UIKit

class WeekTableViewCell: UITableViewCell {

    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var sunTask: UILabel!
    @IBOutlet weak var monTask: UILabel!
    @IBOutlet weak var tueTask: UILabel!
    @IBOutlet weak var wedTask: UILabel!
    @IBOutlet weak var thurs: UILabel!
    @IBOutlet weak var friTask: UILabel!
    @IBOutlet weak var satTask: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

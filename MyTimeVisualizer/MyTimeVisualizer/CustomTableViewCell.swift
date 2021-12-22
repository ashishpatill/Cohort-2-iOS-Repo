//
//  CustomTableViewCell.swift
//  MyTimeVisualizer
//
//  Created by admin on 19/12/2021.
//

import UIKit

protocol SaveItemDelegate {
    func saveItemText(item: String, row:Int)
}

class CustomTableViewCell: UITableViewCell, UITextFieldDelegate {
    
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var noteTextFeild: UITextField!
    var delegate: SaveItemDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        noteTextFeild.delegate = self
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.noteTextFeild.text = nil
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        ((delegate?.saveItemText(item: textField.text! + string, row: textField.tag)) != nil)
    }

}

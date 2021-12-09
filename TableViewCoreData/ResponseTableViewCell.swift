//
//  ResponseTableViewCell.swift
//  TableViewCoreData
//
//  Created by Nathaniel Whittington on 12/8/21.
//

import UIKit

class ResponseTableViewCell: UITableViewCell {

    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var responseLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

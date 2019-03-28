//
//  DetailTableViewCell.swift
//  SampleApp
//
//  Created by admin on 27/03/19.
//  Copyright © 2019 admin. All rights reserved.
//

import UIKit

class DetailTableViewCell: UITableViewCell {

    @IBOutlet  weak var lblName: UILabel!
    @IBOutlet  weak var lblClass: UILabel!
    @IBOutlet  weak var lblSubject: UILabel!
    @IBOutlet  weak var lblStatus: UILabel!
    
    
    var viewModel : StudentViewModel! {
        didSet {
            self.lblName.text = viewModel.name
            self.lblClass.text = viewModel.className
            self.lblSubject.text = viewModel.subject
            self.lblStatus.text = viewModel.status
            self.lblStatus.textColor = viewModel.statusColor
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    static let   identifire = "DetailTableViewCell"
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

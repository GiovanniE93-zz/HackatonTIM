//
//  ViewControllerTableViewCell.swift
//  HackTIM
//
//  Created by Antonio Cangiano on 02/07/2020.
//  Copyright © 2020 Antonio Cangiano. All rights reserved.
//

import Foundation
import UIKit

class ViewControllerTableViewCell: UITableViewCell {

    @IBOutlet weak var heroImage: UIImageView!
    @IBOutlet weak var labelName: UILabel!
    @IBOutlet weak var labelTeam: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

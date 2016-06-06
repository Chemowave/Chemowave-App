//
//  Cancer_Type_CustmTableViewCell.swift
//  Chemowave
//
//  Created by zaktech on 6/2/16.
//  Copyright © 2016 Citrusbits. All rights reserved.
//

import UIKit

class Cancer_Type_CustmTableViewCell: UITableViewCell {

    @IBOutlet weak var rowTitleLabel: UILabel!
    @IBOutlet weak var checkMarkImage : UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

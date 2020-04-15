//
//  SubsectionTableViewCell.swift
//  StoryBook
//
//  Created by Anastasia Legert on 10/4/20.
//  Copyright © 2020 Anastasia Legert. All rights reserved.
//

import UIKit

class SubsectionTableViewCell: UITableViewCell {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subsectionImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

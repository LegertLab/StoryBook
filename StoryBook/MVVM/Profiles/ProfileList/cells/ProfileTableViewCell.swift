//
//  ProfileTableViewCell.swift
//  StoryBook
//
//  Created by Anastasia Legert on 8/4/20.
//  Copyright © 2020 Anastasia Legert. All rights reserved.
//

import UIKit

class ProfileTableViewCell: UITableViewCell {
    var viewModel: ProfileCellViewModel? {
        didSet {
            setupUI()
        }
    }
    
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var kinshipLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        profileImage.layer.cornerRadius = profileImage.frame.size.height / 2
    }

    func setupUI() {
        guard let profile = viewModel?.profile else {
            return
        }
        kinshipLabel.text = profile.kinship
        nameLabel.text = profile.name
        profileImage.image = UIImage(named: "mom")
    }
}

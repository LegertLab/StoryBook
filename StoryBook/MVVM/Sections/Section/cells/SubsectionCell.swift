//
//  SubsectionCell.swift
//  StoryBook
//
//  Created by Anastasia Legert on 12/5/20.
//  Copyright © 2020 Anastasia Legert. All rights reserved.
//

import UIKit

class SubsectionCell: UITableViewCell {
    
    var viewModel: SubsectionCellViewModel? {
        didSet {
            setupUI()
        }
    }
    
    @IBOutlet weak var subsectionImage: UIImageView!
    @IBOutlet weak var subsectionTitleLabel: UILabel!
    
    func setupUI() {
        guard let subsection = viewModel?.subsection else {
            return
        }
        subsectionTitleLabel.text = subsection.title
        subsectionImage.image = UIImage(named: "section")
    }
}

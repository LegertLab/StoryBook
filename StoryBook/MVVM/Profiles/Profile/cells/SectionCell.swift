//
//  SectionCollectionViewCell.swift
//  StoryBook
//
//  Created by Anastasia Legert on 9/4/20.
//  Copyright © 2020 Anastasia Legert. All rights reserved.
//

import UIKit

class SectionCell: UITableViewCell {
    
    var viewModel: SectionCellViewModel? {
        didSet {
            setupUI()
        }
    }
    
    @IBOutlet weak var sectionImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    func setupUI() {
        guard let section = viewModel?.section else {
            return
        }
        titleLabel.text = section.title
        sectionImage.image = UIImage(named: "section")
    }
    
}

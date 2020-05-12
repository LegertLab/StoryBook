//
//  MemoryTableViewCell.swift
//  StoryBook
//
//  Created by Anastasia Legert on 10/4/20.
//  Copyright © 2020 Anastasia Legert. All rights reserved.
//

import UIKit

class MemoryCell: UITableViewCell {

    var viewModel: MemoryCellViewModel? {
        didSet {
            setupUI()
        }
    }
    
    @IBOutlet weak var memoryImage: UIImageView!
    @IBOutlet weak var memoryTitleLabel: UILabel!
    
    func setupUI() {
        guard let memory = viewModel?.memory else {
            return
        }
        memoryTitleLabel.text = memory.title
        memoryImage.image = UIImage(named: "section")
    }
    
}

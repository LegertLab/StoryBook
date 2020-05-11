//
//  ShowMemoryTableVC.swift
//  StoryBook
//
//  Created by Anastasia Legert on 10/4/20.
//  Copyright © 2020 Anastasia Legert. All rights reserved.
//

import UIKit

class MemoryVC: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var placeLabel: UILabel!
    @IBOutlet weak var notesTextField: UITextView!
    
    var viewModel: MemoryViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        titleLabel.text = viewModel?.memory.title
        dateLabel.text = viewModel?.memory.dateOfMemory
        placeLabel.text = viewModel?.memory.place
        notesTextField.text = viewModel?.memory.note
    }
    
    @IBAction func EditTappedButton(_ sender: UIBarButtonItem) {
        viewModel?.routeToEditMemory()
    }
    
}

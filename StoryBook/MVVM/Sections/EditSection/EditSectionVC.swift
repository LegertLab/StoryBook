//
//  EditSectionVC.swift
//  StoryBook
//
//  Created by Anastasia Legert on 24/4/20.
//  Copyright © 2020 Anastasia Legert. All rights reserved.
//

import UIKit

class EditSectionVC: UIViewController {
    
    
    @IBOutlet weak var titleTextField: UITextField!
    
    var viewModel: EditSectionViewModel?

    override func viewDidLoad() {
        super.viewDidLoad()
        titleTextField.text = viewModel?.editedSection.title
    }

    @IBAction func saveEditionTapped(_ sender: UIBarButtonItem) {
       viewModel?.saveSection(
            title: titleTextField.text!
        )
        viewModel?.closeVC()
    }
    
    @IBAction func cancelTapped(_ sender: UIBarButtonItem) {
         viewModel?.closeVC()
    }
}

//
//  EditSubsectionVC.swift
//  StoryBook
//
//  Created by Anastasia Legert on 25/4/20.
//  Copyright © 2020 Anastasia Legert. All rights reserved.
//

import UIKit

class EditSubsectionVC: UIViewController {
    
    @IBOutlet weak var titleTextField: UITextField!
    
    var viewModel: EditSubsectionViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        titleTextField.text = viewModel?.editedSubsection.title
    }

    @IBAction func saveEditionTapped(_ sender: UIBarButtonItem) {
        viewModel?.saveSubsection(title: titleTextField.text!)
        viewModel?.closeVC()
    }
    
    @IBAction func cancelTapped(_ sender: UIBarButtonItem) {
        viewModel?.closeVC()
    }
}

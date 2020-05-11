
//  CreateSubsectionVC.swift
//  StoryBook
//
//  Created by Anastasia Legert on 25/4/20.
//  Copyright © 2020 Anastasia Legert. All rights reserved.
//

import UIKit
import Firebase

class AddSubsectionVC: UIViewController {
    
    @IBOutlet weak var titleTextField: UITextField!
    
    var viewModel: AddSubsectionViewModel?
    
    @IBAction func cancelTapped(_ sender: UIBarButtonItem) {
        viewModel?.closeVC()
    }
    
    @IBAction func saveTapped(_ sender: UIBarButtonItem) {
        viewModel?.saveSubsectionToDatabase(title: titleTextField.text!)
        viewModel?.closeVC()
    }
}

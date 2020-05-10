//
//  CreateSectionVC.swift
//  StoryBook
//
//  Created by Anastasia Legert on 24/4/20.
//  Copyright © 2020 Anastasia Legert. All rights reserved.
//

import UIKit
import Firebase

class AddSectionVC: UIViewController {
    
    @IBOutlet weak var titleTextField: UITextField!
    
    let db = Firestore.firestore()
    var pathToEditedCollection = ""
    
    var viewModel: AddSectionViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func cancelTapped(_ sender: UIBarButtonItem) {
        viewModel?.closeVC()
    }
    
    @IBAction func saveTapped(_ sender: UIBarButtonItem) {
        viewModel?.saveSectionToDatabase(title: titleTextField.text!)
        viewModel?.closeVC()
    }
}

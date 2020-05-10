//
//  CreateProfileVC.swift
//  StoryBook
//
//  Created by Anastasia Legert on 17/4/20.
//  Copyright © 2020 Anastasia Legert. All rights reserved.
//

import UIKit
import Firebase

class AddProfileVC: UIViewController {
    
    @IBOutlet weak var nameTextfield: UITextField!
    @IBOutlet weak var kinshipTextField: UITextField!
    @IBOutlet weak var dateOfBirthTextField: UITextField!
    
    var viewModel: AddProfileViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func cancelTapped(_ sender: UIBarButtonItem) {
        viewModel?.closeVC()
    }
    
    @IBAction func saveNewProfileTapped(_ sender: UIBarButtonItem) {
        viewModel?.saveProfileToDatabase(
            name: nameTextfield.text!,
            kinship: kinshipTextField.text!,
            dateOfBirth: dateOfBirthTextField.text!)
        viewModel?.closeVC()
    }
}

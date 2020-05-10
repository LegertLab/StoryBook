//
//  EditProfileVC.swift
//  StoryBook
//
//  Created by Anastasia Legert on 20/4/20.
//  Copyright © 2020 Anastasia Legert. All rights reserved.
//

import UIKit
import Firebase

class EditProfileVC: UIViewController {
    
    @IBOutlet weak var nameTextfield: UITextField!
    @IBOutlet weak var kinshipTextfield: UITextField!
    @IBOutlet weak var dateOfBirthTextfield: UITextField!
    
    var viewModel: EditProfileViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameTextfield.text = viewModel?.editedProfile.name
        kinshipTextfield.text = viewModel?.editedProfile.kinship
        dateOfBirthTextfield.text = viewModel?.editedProfile.dateOfBirth
    }

    @IBAction func saveEditionTapped(_ sender: UIBarButtonItem) {
        viewModel?.saveEdition(
            name: nameTextfield.text!,
            kinship: kinshipTextfield.text!,
            dateOfBirth: dateOfBirthTextfield.text!
        )
        viewModel?.closeVC()
    }
    
    @IBAction func cancelTapped(_ sender: UIBarButtonItem) {
        viewModel?.closeVC()
    }
    
}

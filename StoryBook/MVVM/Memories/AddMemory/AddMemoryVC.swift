//
//  CreateMemoryVC.swift
//  StoryBook
//
//  Created by Anastasia Legert on 11/4/20.
//  Copyright © 2020 Anastasia Legert. All rights reserved.
//

import UIKit
import Firebase

class AddMemoryVC: UIViewController {
    
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var dateTextField: UITextField!
    @IBOutlet weak var placeTextField: UITextField!
    @IBOutlet weak var noteTextField: UITextField!
    
    var viewModel: AddMemoryViewModel?

    @IBAction func addPhotoTapped(_ sender: UIButton) {
    }
    
    @IBAction func recordAudioTapped(_ sender: UIButton) {
    }
    
    @IBAction func cancelTapped(_ sender: UIBarButtonItem) {
        viewModel?.closeVC()
    }
    @IBAction func saveTapped(_ sender: UIBarButtonItem) {
        viewModel?.saveMemoryToDatabase(
            title: titleTextField.text!,
            note: noteTextField.text!,
            dateOfMemory: dateTextField.text!,
            place: placeTextField.text!)
        viewModel?.closeVC()
    }
}

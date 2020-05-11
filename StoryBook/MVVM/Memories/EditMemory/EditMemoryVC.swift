//
//  EditMemoryVC.swift
//  StoryBook
//
//  Created by Anastasia Legert on 25/4/20.
//  Copyright © 2020 Anastasia Legert. All rights reserved.
//

import UIKit
import Firebase

class EditMemoryVC: UIViewController {
    
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var noteTextField: UITextField!
    @IBOutlet weak var dateOfMemoryTextField: UITextField!
    @IBOutlet weak var placeTextField: UITextField!
    
    var viewModel: EditMemoryViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        titleTextField.text = viewModel?.editedMemory.title
        noteTextField.text = viewModel?.editedMemory.note
        dateOfMemoryTextField.text = viewModel?.editedMemory.dateOfMemory
        placeTextField.text = viewModel?.editedMemory.place
    }
    
    @IBAction func saveEditionTapped(_ sender: UIBarButtonItem) {
        viewModel?.saveMemory(
            title: titleTextField.text!,
            note: noteTextField.text!,
            dateOfMemory: dateOfMemoryTextField.text!,
            place: placeTextField.text!
        )
        viewModel?.closeVC()
    }
    
    @IBAction func cancelTapped(_ sender: UIBarButtonItem) {
        viewModel?.closeVC()
    }
        
}
    
    
    
    
    
    
    
    
    


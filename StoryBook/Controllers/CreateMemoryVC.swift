//
//  CreateMemoryVC.swift
//  StoryBook
//
//  Created by Anastasia Legert on 11/4/20.
//  Copyright © 2020 Anastasia Legert. All rights reserved.
//

import UIKit

class CreateMemoryVC: UIViewController {
    
    weak var delegate: CreateMemoryVCDelegate?
    
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var dateTextField: UITextField!
    @IBOutlet weak var placeTextField: UITextField!
    @IBOutlet weak var noteTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func saveNewMemory() {
        
        let newMemory = Memory(title: titleTextField.text!,
                               note: noteTextField.text!,
                               dateOfMemory: dateTextField.text!,
                               place: placeTextField.text!,
                               documentID: "")
        
        delegate?.update(newItem: newMemory)
        dismiss(animated: true)
        //StorageManager.add(newMemory)
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func addPhotoTapped(_ sender: UIButton) {
    }
    @IBAction func recordAudioTapped(_ sender: UIButton) {
    }
    @IBAction func cancelTapped(_ sender: UIBarButtonItem) {
        dismiss(animated: true)
    }
    @IBAction func saveTapped(_ sender: UIBarButtonItem) {
        saveNewMemory()
    }
}

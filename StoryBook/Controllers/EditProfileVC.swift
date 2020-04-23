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
    
    let db = Firestore.firestore()
    var editedItem = Profile(name: "", kinship: "", dateOfBirth: "", documentID: "")
    var pathToEditedItem = ""
    weak var delegate: EditProfileVCDelegate!
    
    @IBOutlet weak var nameTextfield: UITextField!
    @IBOutlet weak var kinshipTextfield: UITextField!
    @IBOutlet weak var dateOfBirthTextfield: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameTextfield.text = editedItem.name
        kinshipTextfield.text = editedItem.kinship
        dateOfBirthTextfield.text = editedItem.dateOfBirth
    }
    
    func saveEdition() {
        var ref: DocumentReference? = nil
        ref = db.document("\(pathToEditedItem)")
        ref?.setData([
            "name": nameTextfield.text!,
            "kinship": kinshipTextfield.text!,
            "dateOfBirth": dateOfBirthTextfield.text!,
            "documentID": editedItem.documentID
            ]) { err in
            if let err = err {
                print("Error adding document: \(err)")
            } else {
                print("Document added with ID: \(ref!.documentID)")
            }
        }
        delegate?.updateAftedEditing(editedItem: editedItem)
        dismiss(animated: true)
    }


    @IBAction func saveEditionTapped(_ sender: UIBarButtonItem) {
        saveEdition()
    }
    
    @IBAction func cancelTapped(_ sender: UIBarButtonItem) {
        dismiss(animated: true)
    }
}

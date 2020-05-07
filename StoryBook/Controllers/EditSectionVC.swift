//
//  EditSectionVC.swift
//  StoryBook
//
//  Created by Anastasia Legert on 24/4/20.
//  Copyright © 2020 Anastasia Legert. All rights reserved.
//

import UIKit
import Firebase

class EditSectionVC: UIViewController {
    
    let db = Firestore.firestore()
    var editedItem = Section(title: "", documentID: "")
    var pathToEditedItem = ""
    

    @IBOutlet weak var titleTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        titleTextField.text = editedItem.title
        print(editedItem)
    }
    
    func saveEdition() {
        var ref: DocumentReference? = nil
        ref = db.document(pathToEditedItem)
        ref?.setData([
            "title": titleTextField.text!,
            "documentID": editedItem.documentID
            ]) { err in
            if let err = err {
                print("Error adding document: \(err)")
            } else {
                print("Document added with ID: \(ref!.documentID)")
            }
        }
        dismiss(animated: true)
    }

    @IBAction func saveEditionTapped(_ sender: UIBarButtonItem) {
        saveEdition()
    }
    
    @IBAction func cancelTapped(_ sender: UIBarButtonItem) {
         dismiss(animated: true)
    }
    
}

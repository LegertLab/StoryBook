//
//  CreateSectionVC.swift
//  StoryBook
//
//  Created by Anastasia Legert on 24/4/20.
//  Copyright © 2020 Anastasia Legert. All rights reserved.
//

import UIKit
import Firebase

class CreateSectionVC: UIViewController {

    let db = Firestore.firestore()
    var pathToEditedCollection = ""
    
    @IBOutlet weak var titleTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func  saveSectionToDatabase() {
        var ref: DocumentReference? = nil
        ref = db.collection(pathToEditedCollection).addDocument(data: [
            "title": titleTextField.text!,
            "documentID": ""
            ]) { err in
            if let err = err {
                print("Error adding document: \(err)")
            } else {
                print("Document added with ID: \(ref!.documentID)")
            }
        }
    }
    
    @IBAction func cancelTapped(_ sender: UIBarButtonItem) {
        dismiss(animated: true)
    }
    
    @IBAction func saveTapped(_ sender: UIBarButtonItem) {
        saveSectionToDatabase()
        dismiss(animated: true)
    }
}

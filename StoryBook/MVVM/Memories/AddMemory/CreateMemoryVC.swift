//
//  CreateMemoryVC.swift
//  StoryBook
//
//  Created by Anastasia Legert on 11/4/20.
//  Copyright © 2020 Anastasia Legert. All rights reserved.
//

import UIKit
import Firebase

class CreateMemoryVC: UIViewController {
       
    let db = Firestore.firestore()
    var pathToEditedCollection = ""
    
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var dateTextField: UITextField!
    @IBOutlet weak var placeTextField: UITextField!
    @IBOutlet weak var noteTextField: UITextField!
    
    
    func saveNewMemoryToDatabase() {
        
        var ref: DocumentReference? = nil
        ref = db.collection(pathToEditedCollection).addDocument(data: [
            "title": titleTextField.text!,
            "note": noteTextField.text!,
            "dateOfMemory": dateTextField.text!,
            "place": placeTextField.text!,
            "documentID": ""
            ]) { err in
            if let err = err {
                print("Error adding document: \(err)")
            } else {
                print("Document added with ID: \(ref!.documentID)")
            }
        }
    }

    @IBAction func addPhotoTapped(_ sender: UIButton) {
    }
    @IBAction func recordAudioTapped(_ sender: UIButton) {
    }
    
    @IBAction func cancelTapped(_ sender: UIBarButtonItem) {
        dismiss(animated: true)
    }
    @IBAction func saveTapped(_ sender: UIBarButtonItem) {
        saveNewMemoryToDatabase()
        dismiss(animated: true)
    }
    
    
}

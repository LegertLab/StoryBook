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
    
    let db = Firestore.firestore()
    var editedItem = Memory(title: "", note: "", dateOfMemory: "", place: "", documentID: "")
    var pathToEditedItem = ""
    
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var noteTextField: UITextField!
    @IBOutlet weak var dateOfMemoryTextField: UITextField!
    @IBOutlet weak var placeTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        titleTextField.text = editedItem.title
        noteTextField.text = editedItem.note
        dateOfMemoryTextField.text = editedItem.dateOfMemory
        placeTextField.text = editedItem.place
    }
    
    func saveEdition() {
        var ref: DocumentReference? = nil
        ref = db.document(pathToEditedItem)
        ref?.setData([
            "title": titleTextField.text!,
            "note": noteTextField.text!,
            "dateOfMemory": dateOfMemoryTextField.text!,
            "place": placeTextField.text!,
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
    
    
    
    
    
    
    
    
    


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

    let db = Firestore.firestore()
    var pathToEditedCollection = ""
    
    weak var delegate: CreateProfileVCDelegate!
    
    @IBOutlet weak var nameTextfield: UITextField!
    @IBOutlet weak var kinshipTextField: UITextField!
    @IBOutlet weak var dateOfBirthTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func saveNewProfile() {
        
        let newProfile = Profile(name: nameTextfield.text!,
                                 kinship: kinshipTextField.text!,
                                 dateOfBirth: dateOfBirthTextField.text!,
                                 documentID: "")
        
        //delegate?.update(newItem: newProfile)
        dismiss(animated: true)
        saveProfileToDatabase()
    }
    
    func  saveProfileToDatabase() {
        var ref: DocumentReference? = nil
        ref = db.collection(pathToEditedCollection).addDocument(data: [
            "name": nameTextfield.text!,
            "kinship": kinshipTextField.text!,
            "dateOfBirth": dateOfBirthTextField.text!,
            "documentID": ""
            ]) { err in
            if let err = err {
                print("Error adding document: \(err)")
            } else {
                print("Document added with ID: \(ref!.documentID)")
            }
        }
    }

    
    
           
           //        let city = Profile(name: "Los Angeles",
           //                        state: "CA",
           //                        country: "USA",
           //                        isCapital: false,
           //                        population: 5000000)
           //
           //        do {
           //            try db.collection("cities").document("LA").setData(from: city)
           //        } catch let error {
           //            print("Error writing city to Firestore: \(error)")
           //        }
           //
           //
           //        // Add a new document with a generated id.
           //        var ref: DocumentReference? = nil
           //        ref = db.collection("cities").addDocument(data: [
           //            "name": "Tokyo",
           //            "country": "Japan"
           //        ]) { err in
           //            if let err = err {
           //                print("Error adding document: \(err)")
           //            } else {
           //                print("Document added with ID: \(ref!.documentID)")
           //            }
           //        }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    
    @IBAction func cancelTapped(_ sender: UIBarButtonItem) {
                dismiss(animated: true)
    }
    
    @IBAction func saveTapped(_ sender: UIBarButtonItem) {
        saveNewProfile()
    }
    
}

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

    var profile = Profile(name: "", kinship: "", dateOfBirth: "", documentID: ""/*, sections: []*/)
    let db = Firestore.firestore()
    var pathToProfile = ""
    
    @IBOutlet weak var nameTextfield: UITextField!
    @IBOutlet weak var kinshipTextfield: UITextField!
    @IBOutlet weak var dateOfBirthTextfield: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(profile)
        nameTextfield.text = profile.name
        kinshipTextfield.text = profile.kinship
        dateOfBirthTextfield.text = profile.dateOfBirth
    }
    
    func saveEdition() {
        var ref: DocumentReference? = nil
        ref = db.document("\(pathToProfile)")
        ref?.setData([
            "name": nameTextfield.text!,
            "kinship": kinshipTextfield.text!,
            "dateOfBirth": dateOfBirthTextfield.text!,
            "documentID": profile.documentID
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

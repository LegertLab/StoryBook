//
//  EditProfileViewModel.swift
//  StoryBook
//
//  Created by Anastasia Legert on 9/5/20.
//  Copyright © 2020 Anastasia Legert. All rights reserved.
//

import Foundation
import Firebase

class EditProfileViewModel {
    
    var router: EditProfileRouter!
    
    var editedProfile = Profile(name: "", kinship: "", dateOfBirth: "", documentID: "")
    private let firestore = Firestore.firestore()
    private var pathToEditedProfile = ""
    
    
    init(editedProfile: Profile, pathToEditedProfile: String) {
        self.editedProfile = editedProfile;
        self.pathToEditedProfile = pathToEditedProfile
    }
    
    func saveEdition(name: String, kinship: String, dateOfBirth: String) {
        var ref: DocumentReference? = nil
        ref = firestore.document("\(pathToEditedProfile)")
        ref?.setData([
            "name": name,
            "kinship": kinship,
            "dateOfBirth": dateOfBirth,
            "documentID": editedProfile.documentID
            ]) { err in
            if let err = err {
                print("Error adding document: \(err)")
            } else {
                print("Document added with ID: \(ref!.documentID)")
            }
        }
    }
    
    func closeVC() {
        router.closeVC()
    }
}

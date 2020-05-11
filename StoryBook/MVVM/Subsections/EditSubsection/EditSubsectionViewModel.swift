//
//  EditSubsectionViewModel.swift
//  StoryBook
//
//  Created by Anastasia Legert on 11/5/20.
//  Copyright © 2020 Anastasia Legert. All rights reserved.
//

import Foundation
import Firebase

class EditSubsectionViewModel {
    
    var router: EditSubsectionRouter!
    
    var editedSubsection = Section(title: "", documentID: "")
    private let firestore = Firestore.firestore()
    private var pathToEditedSubsection = ""
    
    
    init(editedSubsection: Section, pathToEditedSubsection: String) {
        self.editedSubsection = editedSubsection;
        self.pathToEditedSubsection = pathToEditedSubsection
    }
    
    func saveSubsection(title: String) {
        var ref: DocumentReference? = nil
        ref = firestore.document("\(pathToEditedSubsection)")
        ref?.setData([
            "title": title,
            "documentID": editedSubsection.documentID
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

//
//  EditSectionViewModel.swift
//  StoryBook
//
//  Created by Anastasia Legert on 10/5/20.
//  Copyright © 2020 Anastasia Legert. All rights reserved.
//

import Foundation
import Firebase

class EditSectionViewModel {
    
    var router: EditSectionRouter!
    
    var editedSection = Section(title: "", documentID: "")
    private let firestore = Firestore.firestore()
    private var pathToEditedSection = ""
    
    
    init(editedSection: Section, pathToEditedSection: String) {
        self.editedSection = editedSection;
        self.pathToEditedSection = pathToEditedSection
    }
    
    func saveSection(title: String) {
        var ref: DocumentReference? = nil
        ref = firestore.document("\(pathToEditedSection)")
        ref?.setData([
            "title": title,
            "documentID": editedSection.documentID
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

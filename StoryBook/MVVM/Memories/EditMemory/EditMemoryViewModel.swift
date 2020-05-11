//
//  EditMemory.swift
//  StoryBook
//
//  Created by Anastasia Legert on 11/5/20.
//  Copyright © 2020 Anastasia Legert. All rights reserved.
//

import Foundation
import Firebase

class EditMemoryViewModel {
    
    var router: EditMemoryRouter!
    
    var editedMemory = Memory(title: "", note: "", dateOfMemory: "", place: "", documentID: "")
    private let firestore = Firestore.firestore()
    private var pathToEditedMemory = ""
    
    init(editedMemory: Memory, pathToEditedMemory: String) {
        self.editedMemory = editedMemory;
        self.pathToEditedMemory = pathToEditedMemory
    }
    
    func saveMemory(
        title: String,
        note: String,
        dateOfMemory: String,
        place: String
    ) {
        var ref: DocumentReference? = nil
        ref = firestore.document("\(pathToEditedMemory)")
        ref?.setData([
            "title": title,
            "note": note,
            "dateOfMemory": dateOfMemory,
            "place": place,
            "documentID": editedMemory.documentID
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

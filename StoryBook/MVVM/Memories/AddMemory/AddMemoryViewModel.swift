//
//  AddMemoryViewModel.swift
//  StoryBook
//
//  Created by Anastasia Legert on 11/5/20.
//  Copyright © 2020 Anastasia Legert. All rights reserved.
//

import Foundation
import Firebase

class AddMemoryViewModel {
    
    var router: AddMemoryRouter!
    
    private let firestore = Firestore.firestore()
    private var pathToDataBase = ""
    
    init(pathToDataBase: String) {
        self.pathToDataBase = pathToDataBase
    }
    
    func  saveMemoryToDatabase(
        title: String,
        note: String,
        dateOfMemory: String,
        place: String,
        _ documentID: String = ""
    ) {
        var ref: DocumentReference? = nil
        ref = firestore.collection(pathToDataBase).addDocument(data: [
            "title": title,
            "note": note,
            "dateOfMemory": dateOfMemory,
            "place": place,
            "documentID": ""
        ]) { err in
            if let err = err {
                print("Error adding document: \(err)")
            } else {
                print("Document added with ID: \(ref!.documentID)")
            }
        }
    }
    
    func closeVC () {
        router.closeVC()
    }
}

//
//  SectionViewModel.swift
//  StoryBook
//
//  Created by Anastasia Legert on 6/5/20.
//  Copyright © 2020 Anastasia Legert. All rights reserved.
//

import Foundation
import Firebase

class SectionViewModel {
    var section = Section(title: "", documentID: "")
    var subsections: [Section] = []
    var pathToPreviousLevel = ""
    private let firestore = Firestore.firestore()
    private var listener: ListenerRegistration?
    private var query: Query?

    var pathToDataBase: String {
        return "\(pathToPreviousLevel)/\(section.documentID)/subsections"
    }
    
    init() {
        query = firestore.collection(pathToDataBase)
    }
    
    init(section: Section, pathToPreviousLevel: String) {
        self.section = section;
        self.pathToPreviousLevel = pathToPreviousLevel
        query = firestore.collection(pathToDataBase)
    }
    
    func observeQuery(completion: @escaping (_ sections: [Section]) -> Void) {
      guard let query = query else { return }
      listener = query.addSnapshotListener { (snapshot, error) in
        guard let snapshot = snapshot else {
            if let error = error {
                print(error)
                completion([])
            }
            return
        }
        let models = snapshot.documents
            .map { (document) -> Section? in
                return Section(
                    dictionary: document.data(),
                    documentID: document.documentID
                )
            }
            .compactMap {
                $0
            }

        self.subsections = models
        completion(models)
      }
    }
    
    func getSection(by index: Int) -> Section? {
        if index > subsections.count {
            return nil
        }
        return subsections[index]
    }
    
    func delete(by index: Int) {
        if let section = getSection(by: index) {
            let deletedDocID = section.documentID
            self.firestore.document("\(self.pathToDataBase)/\(deletedDocID)").delete()
            self.subsections.remove(at: index)
        }
    }
    
    func edit(by index: Int) {
        
    }

}

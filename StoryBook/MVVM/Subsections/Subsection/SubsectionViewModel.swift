//
//  SubsectionViewModel.swift
//  StoryBook
//
//  Created by Anastasia Legert on 11/5/20.
//  Copyright © 2020 Anastasia Legert. All rights reserved.
//

import Foundation
import Firebase

class SubsectionViewModel {
    
    var router: SubsectionRouter!
    
    var subsection = Section(title: "", documentID: "")
    var memories: [Memory] = []
    var pathToPreviousLevel = ""
    private let firestore = Firestore.firestore()
    private var listener: ListenerRegistration?
    private var query: Query?

    var pathToDataBase: String {
        return "\(pathToPreviousLevel)/\(subsection.documentID)/memories"
    }
    
    init() {
        query = firestore.collection(pathToDataBase)
    }
    
    init(subsection: Section, pathToPreviousLevel: String) {
        self.subsection = subsection;
        self.pathToPreviousLevel = pathToPreviousLevel
        query = firestore.collection(pathToDataBase)
    }
    
    func observeQuery(completion: @escaping (_ memories: [Memory]) -> Void) {
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
            .map { (document) -> Memory? in
                return Memory(
                    dictionary: document.data(),
                    documentID: document.documentID
                )
            }
            .compactMap {
                $0
            }

        self.memories = models
        completion(models)
      }
    }
    
    func getMemory(by index: Int) -> Memory? {
        if index > memories.count {
            return nil
        }
        return memories[index]
    }
    
    func deleteMemory(by index: Int) {
        if let memory = getMemory(by: index) {
            let deletedDocID = memory.documentID
            self.firestore.document("\(self.pathToDataBase)/\(deletedDocID)").delete()
            self.memories.remove(at: index)
        }
    }
    
    func routeToEditMemory(by index: Int) {
        if let memory = getMemory(by: index) {
            let pathToEditedMemory = "\(self.pathToDataBase)/\(memory.documentID)"
            router.routeToEditMemory(editedMemory: memory, pathToEditedMemory: pathToEditedMemory)
        }
    }
    
    func routeToAddNewMemory() {
        router.routeToAddNewMemory(pathToDataBase: pathToDataBase)
    }
    
    func routeToDetailMemory(by index: Int) {
        if let memory = getMemory(by: index) {
            router.routeToDetailMemory(memory: memory, pathToDataBase: pathToDataBase)
        }
    }
}

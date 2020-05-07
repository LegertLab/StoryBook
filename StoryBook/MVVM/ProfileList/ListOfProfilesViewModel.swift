//
//  ListOfProfilesViewModel.swift
//  StoryBook
//
//  Created by Denis Khlopin on 28.04.2020.
//  Copyright © 2020 Anastasia Legert. All rights reserved.
//

import Foundation
import Firebase

class ProfileListViewModel {
    var profiles: [Profile] = []
    private let firestore = Firestore.firestore()
    private var pathToPreviousLevel = "users/testUser"
    private var listener: ListenerRegistration?
    private var query: Query?

    var pathToDataBase: String {
        return "\(pathToPreviousLevel)/profiles"
    }
    
    init() {
        query = firestore.collection(pathToDataBase)
    }
    
    func observeQuery(completion: @escaping (_ profiles: [Profile]) -> Void) {
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
            .map { (document) -> Profile? in
                return Profile(
                    dictionary: document.data(),
                    documentID: document.documentID
                )
            }
            .compactMap {
                $0
            }

        self.profiles = models
        completion(models)
      }
    }
    
    func getProfile(by index: Int) -> Profile? {
        if index > profiles.count {
            return nil
        }
        return profiles[index]
    }
    
    func delete(by index: Int) {
        if let profile = getProfile(by: index) {
            let deletedDocID = profile.documentID
            self.firestore.document("\(self.pathToDataBase)/\(deletedDocID)").delete()
            self.profiles.remove(at: index)
        }
    }
    
    func edit(by index: Int) {
        
    }
}

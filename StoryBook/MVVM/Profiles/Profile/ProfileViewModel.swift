//
//  ProfileViewModel.swift
//  StoryBook
//
//  Created by Anastasia Legert on 5/5/20.
//  Copyright © 2020 Anastasia Legert. All rights reserved.
//

import Foundation
import Firebase

class ProfileViewModel {
    var router: ProfileRouter!
    
    var profile = Profile(name: "", kinship: "", dateOfBirth: "", documentID: "")
    var sections: [Section] = []
    var pathToPreviousLevel = ""
    private let firestore = Firestore.firestore()
    private var listener: ListenerRegistration?
    private var query: Query?
    
    var pathToDataBase: String {
        return "\(pathToPreviousLevel)/\(profile.documentID)/sections"
    }
    
    init() {
        query = firestore.collection(pathToDataBase)
    }
    
    init(profile: Profile, pathToPreviousLevel: String) {
        self.profile = profile;
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
            
            self.sections = models
            completion(models)
        }
    }
    
    func getSection(by index: Int) -> Section? {
        if index > sections.count {
            return nil
        }
        return sections[index]
    }
    
    func deleteSection(by index: Int) {
        if let section = getSection(by: index) {
            let deletedDocID = section.documentID
            self.firestore.document("\(self.pathToDataBase)/\(deletedDocID)").delete()
            self.sections.remove(at: index)
        }
    }
    
    func routeToEditSection(by index: Int) {
        if let section = getSection(by: index) {
            let pathToEditedSection = "\(self.pathToDataBase)/\(section.documentID)"
            router.routeToEditSection(editedSection: section, pathToEditedSection: pathToEditedSection)
        }
    }
    
    func routeToAddNewSection() {
        router.routeToAddNewSection(pathToDataBase: pathToDataBase)
    }
    
    func routeToDetailSection(by index: Int) {
        if let section = getSection(by: index) {
            router.routeToDetailSection(section: section, pathToDataBase: pathToDataBase)
        }
    }
}

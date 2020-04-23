//
//  Memory.swift
//  StoryBook
//
//  Created by Anastasia Legert on 6/4/20.
//  Copyright © 2020 Anastasia Legert. All rights reserved.
//

import Foundation
import Firebase

struct Memory {
    let title: String
    let note: String
    let dateOfMemory: String
    let place: String
    let documentID: String
    
    var dictionary: [String: Any] {
      return [
        "title": title,
        "note": note,
        "dateOfMemory": dateOfMemory,
        "place": place,
        "documentID": documentID
      ]
    }
}

extension Memory: DocumentSerializable {
    init?(dictionary: [String : Any], documentID: String) {
      guard let title = dictionary["title"] as? String,
            let note = dictionary["note"] as? String,
            let dateOfMemory = dictionary["dateOfMemory"] as? String,
            let place = dictionary["place"] as? String,
            let documentID = documentID as? String
            else { return nil }

      self.init(title: title,
                note: note,
                dateOfMemory: dateOfMemory,
                place: place,
                documentID: documentID
        )
    }
}




    //let userId: String
    //let ref: DatabaseReference?
    //let dateOfCreation: Date
    //let photos: [UIImage]
    //let notes: [String]
    //let audios: AVAudioSession
    
    //init(title: String, userId: String, note: String) {
//        self.title = title
//        self.userId = userId
//        self.note = note
       // self.ref = nil
    //}
   
    
    //init(snapshot: DataSnapshot) {
//        let snapshotValue = snapshot.value as! [String: AnyObject]
//        title = snapshotValue["title"] as! String
//        userId = snapshotValue["userId"] as! String
//        note = snapshotValue["note"] as! String
//        ref = snapshot.ref
//    }

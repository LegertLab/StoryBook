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
    let userId: String
    //let ref: DatabaseReference?
    let note: String
    //let dateOfCreation: Date
    //let dateOfMemory: Date
    //let photos: [UIImage]
    //let notes: [String]
    //let audios: AVAudioSession
    
    init(title: String, userId: String, note: String) {
        self.title = title
        self.userId = userId
        self.note = note
       // self.ref = nil
    }
   
    //init(snapshot: DataSnapshot) {
//        let snapshotValue = snapshot.value as! [String: AnyObject]
//        title = snapshotValue["title"] as! String
//        userId = snapshotValue["userId"] as! String
//        note = snapshotValue["note"] as! String
//        ref = snapshot.ref
//    }

}

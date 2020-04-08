//
//  User.swift
//  StoryBook
//
//  Created by Anastasia Legert on 6/4/20.
//  Copyright © 2020 Anastasia Legert. All rights reserved.
//

import Foundation
import Firebase

struct User {
    
    let userID: String
    let email: String
    
    init(user: User) {
        self.userID = user.userID
        self.email = user.email
    }
}

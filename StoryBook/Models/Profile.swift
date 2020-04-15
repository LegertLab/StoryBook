//
//  Profile.swift
//  StoryBook
//
//  Created by Anastasia Legert on 4/4/20.
//  Copyright © 2020 Anastasia Legert. All rights reserved.
//

import UIKit
struct Profile {
    // main properties
    let name: String
    //let lastName: String
    //let sex: String
    //let photo: UIImage? = nil
    let kinship: String
    let dateOfBirth: String
    let sections: [Section]
    //let placeOfBirth: String? = nil
    
    // optional properties
    
    //let familyGroup: FamilyGroup
//    let profession: 
//    let family:
//    let friends:
    
    
}

struct Section {
    let title: String
    let subsections: [Subsection]
    
}

struct Subsection {
    let title: String
    let memories: [Memory]
}

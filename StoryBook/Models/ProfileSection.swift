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
    var name: String
    //let lastName: String
    //let sex: String
    //let photo: UIImage? = nil
    var kinship: String
    var dateOfBirth: String
    var documentID: String
   // var sections: [Section]
    
    var dictionary: [String: Any] {
      return [
        "name": name,
        "kinship": kinship,
        "dateOfBirth": dateOfBirth,
        "documentID": documentID//,
       // "sections": sections
      ]
    }
}

protocol DocumentSerializable {
    init?(dictionary: [String: Any], documentID: String)
}
    
extension Profile: DocumentSerializable {
//    static let kinship = [
//      "мама", "папа", "дедушка", "бабушка", "дочь", "сын", "брат",
//      "сестра", "тетя", "дядя", "жена", "муж"
//    ]
    
    init?(dictionary: [String : Any], documentID: String) {
      guard let name = dictionary["name"] as? String,
          let kinship = dictionary["kinship"] as? String,
          let dateOfBirth = dictionary["dateOfBirth"] as? String,
          let documentID = documentID as? String/*,
        let sections = documentSections["sections"] as? [Section]*/
        else { return nil }

      self.init(name: name,
                kinship: kinship,
                dateOfBirth: dateOfBirth,
                documentID: documentID//,
                //sections: sections
        )
    }
}
    
    
    //let placeOfBirth: String? = nil
    
    // optional properties
    
    //let familyGroup: FamilyGroup
//    let profession: 
//    let family:
//    let friends:
    
    


struct Section {
    var title: String
    var documentID: String
    
    var dictionary: [String: Any] {
      return [
        "title": title,
        "documentID": documentID
      ]
    }
}

extension Section: DocumentSerializable {
    init?(dictionary: [String : Any], documentID: String) {
      guard let title = dictionary["title"] as? String,
          let documentID = documentID as? String
          else { return nil }

      self.init(title: title,
                documentID: documentID
        )
    }
}





//struct Subsection {
//    let title: String
//    let memories: [Memory]
//}


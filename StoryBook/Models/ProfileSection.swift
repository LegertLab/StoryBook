//
//  Profile.swift
//  StoryBook
//
//  Created by Anastasia Legert on 4/4/20.
//  Copyright © 2020 Anastasia Legert. All rights reserved.
//

import UIKit

struct Profile {
    var name: String
    var kinship: String
    var dateOfBirth: String
    var documentID: String
    
    var dictionary: [String: Any] {
      return [
        "name": name,
        "kinship": kinship,
        "dateOfBirth": dateOfBirth,
        "documentID": documentID
      ]
    }
}

protocol DocumentSerializable {
    init?(dictionary: [String: Any], documentID: String)
}
    
extension Profile: DocumentSerializable {
    
    init?(dictionary: [String : Any], documentID: String) {
      guard let name = dictionary["name"] as? String,
          let kinship = dictionary["kinship"] as? String,
          let dateOfBirth = dictionary["dateOfBirth"] as? String,
          let documentID = documentID as? String
        else { return nil }

      self.init(name: name,
                kinship: kinship,
                dateOfBirth: dateOfBirth,
                documentID: documentID
        )
    }
}

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

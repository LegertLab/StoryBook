//
//  Section.swift
//  StoryBook
//
//  Created by Anastasia Legert on 10/5/20.
//  Copyright © 2020 Anastasia Legert. All rights reserved.
//

import UIKit

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

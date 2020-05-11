//
//  Protocols.swift
//  StoryBook
//
//  Created by Anastasia Legert on 10/5/20.
//  Copyright © 2020 Anastasia Legert. All rights reserved.
//

import Foundation

protocol DocumentSerializable {
    init?(dictionary: [String: Any], documentID: String)
}

//
//  Protocols.swift
//  StoryBook
//
//  Created by Anastasia Legert on 22/4/20.
//  Copyright © 2020 Anastasia Legert. All rights reserved.
//

import UIKit

protocol CreateProfileVCDelegate: class {
    func update(newItem: Profile)                       
}

protocol CreateSectionVCDelegate: class {
    func update(newItem: Section)
}

protocol CreateMemoryVCDelegate: class {
    func update(newItem: Memory)
}

protocol EditProfileVCDelegate: class {
    func updateAfterEditing(editedItem: Profile)
}

protocol EditSectionVCDelegate: class {
    func updateAfterEditing(editedItem: Section)
}

protocol EditMemoryVCDelegate: class {
    func updateAfterEditing(editedItem: Memory)
}



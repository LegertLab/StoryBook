//
//  Protocols.swift
//  StoryBook
//
//  Created by Anastasia Legert on 22/4/20.
//  Copyright © 2020 Anastasia Legert. All rights reserved.
//

import UIKit

protocol CreateProfileViewControllerDelegate: class {
    func update(newItem: Profile)                       
}

protocol CreateSectionViewControllerDelegate: class {
    func update(newItem: Section)
}

protocol CreateMemoryViewControllerDelegate: class {
    func update(newItem: Memory)
}

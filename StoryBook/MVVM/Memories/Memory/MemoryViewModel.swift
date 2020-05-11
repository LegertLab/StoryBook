//
//  MemoryViewModel.swift
//  StoryBook
//
//  Created by Anastasia Legert on 11/5/20.
//  Copyright © 2020 Anastasia Legert. All rights reserved.
//

import Foundation

class MemoryViewModel {
    
    var router: MemoryRouter!
    
    var memory = Memory(title: "", note: "", dateOfMemory: "", place: "", documentID: "")
    var pathToPreviousLevel = ""
    
    init(memory: Memory, pathToPreviousLevel: String) {
        self.memory = memory;
        self.pathToPreviousLevel = pathToPreviousLevel
    }
    
    func routeToEditMemory() {
            let pathToEditedMemory = "\(self.pathToPreviousLevel)/\(memory.documentID)"
            router.routeToEditMemory(editedMemory: memory, pathToEditedMemory: pathToEditedMemory)
    }
}

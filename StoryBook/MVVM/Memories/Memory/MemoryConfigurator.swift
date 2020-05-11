//
//  MemoryConfigurator.swift
//  StoryBook
//
//  Created by Anastasia Legert on 11/5/20.
//  Copyright © 2020 Anastasia Legert. All rights reserved.
//

import UIKit

class MemoryConfigurator {
    
    weak var viewController: MemoryVC?
    
    init?(memory: Memory, pathToPreviousLevel: String){
        let viewModel = MemoryViewModel(memory: memory, pathToPreviousLevel: pathToPreviousLevel)
        let router = MemoryRouter()
        viewModel.router = router
        guard let viewController = UIStoryboard(name: "Memory", bundle: nil)
            .instantiateViewController(withIdentifier: "MemoryVC") as? MemoryVC else {
                return nil
        }
        viewController.viewModel = viewModel
        self.viewController = viewController
    }
}

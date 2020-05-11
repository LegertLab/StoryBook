//
//  MemoryRouter.swift
//  StoryBook
//
//  Created by Anastasia Legert on 11/5/20.
//  Copyright © 2020 Anastasia Legert. All rights reserved.
//

import UIKit

class MemoryRouter {
    weak var navigationController: UINavigationController?
    
    static func push(
        navigationController: UINavigationController,
        memory: Memory,
        pathToPreviousLevel: String,
        animated: Bool = true
    ) {
        guard
            let configurator = MemoryConfigurator(
                memory: memory,
                pathToPreviousLevel: pathToPreviousLevel
            ),
            let viewController = configurator.viewController
            else {
                return
        }
        viewController.viewModel?.router.navigationController = navigationController
        
        navigationController.pushViewController(viewController, animated: animated)
    }
    
    func routeToEditMemory(editedMemory: Memory, pathToEditedMemory: String) {
        if let navigationController = self.navigationController {
            EditMemoryRouter.push(
                navigationController: navigationController,
                editedMemory: editedMemory,
                pathToEditedMemory: pathToEditedMemory)
        }
    }
}

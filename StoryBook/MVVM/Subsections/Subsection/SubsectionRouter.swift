//
//  SubsectionRouter.swift
//  StoryBook
//
//  Created by Anastasia Legert on 11/5/20.
//  Copyright © 2020 Anastasia Legert. All rights reserved.
//

import UIKit

class SubsectionRouter {
    weak var navigationController: UINavigationController?
    
    static func push(
        navigationController: UINavigationController,
        subsection: Section,
        pathToPreviousLevel: String,
        animated: Bool = true
    ) {
        guard
            let configurator = SubsectionConfigurator(
                subsection: subsection,
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
    
    func routeToAddNewMemory(pathToDataBase: String) {
        if let navigationController = self.navigationController {
            AddMemoryRouter.push(
                navigationController: navigationController,
                pathToDataBase: pathToDataBase)
        }
    }
    
    func routeToDetailMemory(memory: Memory, pathToDataBase: String) {
        if let navigationController = self.navigationController {
            MemoryRouter.push(
                navigationController: navigationController,
                memory: memory,
                pathToPreviousLevel: pathToDataBase)
        }
    }
}

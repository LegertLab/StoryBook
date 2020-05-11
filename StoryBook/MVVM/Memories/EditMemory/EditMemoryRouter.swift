//
//  EditMemoryRouter.swift
//  StoryBook
//
//  Created by Anastasia Legert on 11/5/20.
//  Copyright © 2020 Anastasia Legert. All rights reserved.
//

import UIKit

class EditMemoryRouter {

    weak var navigationController: UINavigationController?
    
    static func push(
        navigationController: UINavigationController,
        editedMemory: Memory,
        pathToEditedMemory: String,
        animated: Bool = true
    ) {
        guard
            let configurator = EditMemoryConfigurator(
                editedMemory: editedMemory,
                pathToEditedMemory: pathToEditedMemory
            ),
            let viewController = configurator.viewController
        else {
            return
        }
        viewController.viewModel?.router.navigationController = navigationController
        
        navigationController.pushViewController(viewController, animated: animated)
    }
    
    func closeVC () {
        navigationController?.popViewController(animated: true)
    }
}

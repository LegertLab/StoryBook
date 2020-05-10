//
//  EditRouter.swift
//  StoryBook
//
//  Created by Anastasia Legert on 10/5/20.
//  Copyright © 2020 Anastasia Legert. All rights reserved.
//

import UIKit

class EditSectionRouter {

    weak var navigationController: UINavigationController?
    
    static func push(
        navigationController: UINavigationController,
        editedSection: Section,
        pathToEditedSection: String,
        animated: Bool = true
    ) {
        guard
            let configurator = EditSectionConfigurator(
                editedSection: editedSection,
                pathToEditedSection: pathToEditedSection
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

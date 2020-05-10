//
//  SectionRouter.swift
//  StoryBook
//
//  Created by Anastasia Legert on 10/5/20.
//  Copyright © 2020 Anastasia Legert. All rights reserved.
//

import UIKit

class SectionRouter {
    weak var navigationController: UINavigationController?
    
    static func push(
        navigationController: UINavigationController,
        section: Section,
        pathToPreviousLevel: String,
        animated: Bool = true
    ) {
        guard
            let configurator = SectionConfigurator(
                section: section,
                pathToPreviousLevel: pathToPreviousLevel
            ),
            let viewController = configurator.viewController
            else {
                return
        }
        viewController.viewModel?.router.navigationController = navigationController
        
        navigationController.pushViewController(viewController, animated: animated)
    }
    
    func routeToEditSubsection(editedSubsection: Section, pathToEditedSubsection: String) {
        if let navigationController = self.navigationController {
//            EditSubsectionRouter.push(
//                navigationController: navigationController,
//                editedSubsection: editedSubsection,
//                pathToEditedSubsection: pathToEditedSubsection)
        }
    }
    
    func routeToAddNewSubsection(pathToDataBase: String) {
        if let navigationController = self.navigationController {
//            AddSubsectionRouter.push(
//                navigationController: navigationController,
//                pathToDataBase: pathToDataBase)
        }
    }
    
    func routeToDetailSubsection(subsection: Section, pathToDataBase: String) {
        if let navigationController = self.navigationController {
//            SubsectionRouter.push(
//                navigationController: navigationController,
//                subsection: subsection,
//                pathToPreviousLevel: pathToDataBase)
        }
    }
}

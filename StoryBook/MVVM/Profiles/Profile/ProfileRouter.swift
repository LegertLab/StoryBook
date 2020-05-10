//
//  ProfileRouter.swift
//  StoryBook
//
//  Created by Denis Khlopin on 07.05.2020.
//  Copyright © 2020 Anastasia Legert. All rights reserved.
//

import UIKit

class ProfileRouter {
    weak var navigationController: UINavigationController?
    
    static func push(
        navigationController: UINavigationController,
        profile: Profile,
        pathToPreviousLevel: String,
        animated: Bool = true
    ) {
        guard
            let configurator = ProfileConfigurator(
                profile: profile,
                pathToPreviousLevel: pathToPreviousLevel
            ),
            let viewController = configurator.viewController
            else {
                return
        }
        viewController.viewModel?.router.navigationController = navigationController
        
        navigationController.pushViewController(viewController, animated: animated)
    }
    
    func routeToEditSection(editedSection: Section, pathToEditedSection: String) {
        if let navigationController = self.navigationController {
            EditSectionRouter.push(
                navigationController: navigationController,
                editedSection: editedSection,
                pathToEditedSection: pathToEditedSection)
        }
    }
    
    func routeToAddNewSection(pathToDataBase: String) {
        if let navigationController = self.navigationController {
            AddSectionRouter.push(
                navigationController: navigationController,
                pathToDataBase: pathToDataBase)
        }
    }
    
    func routeToDetailSection(section: Section, pathToDataBase: String) {
        if let navigationController = self.navigationController {
            SectionRouter.push(
                navigationController: navigationController,
                section: section,
                pathToPreviousLevel: pathToDataBase)
        }
    }
}

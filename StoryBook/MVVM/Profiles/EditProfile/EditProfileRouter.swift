//
//  EditProfileRouter.swift
//  StoryBook
//
//  Created by Anastasia Legert on 9/5/20.
//  Copyright © 2020 Anastasia Legert. All rights reserved.
//

import UIKit

class EditProfileRouter {

    weak var navigationController: UINavigationController?
    
    static func push(
        navigationController: UINavigationController,
        editedProfile: Profile,
        pathToEditedProfile: String,
        animated: Bool = true
    ) {
        guard
            let configurator = EditProfileConfigurator(
                editedProfile: editedProfile,
                pathToEditedProfile: pathToEditedProfile
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

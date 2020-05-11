//
//  AddMemoryRouter.swift
//  StoryBook
//
//  Created by Anastasia Legert on 11/5/20.
//  Copyright © 2020 Anastasia Legert. All rights reserved.
//

import UIKit

class AddMemoryRouter {
    
    weak var navigationController: UINavigationController?
    
    static func push(
        navigationController: UINavigationController,
        pathToDataBase: String,
        animated: Bool = true
    ) {
        guard let configurator = AddMemoryConfigurator(pathToDataBase: pathToDataBase),
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

//
//  ProfileListRouter.swift
//  StoryBook
//
//  Created by Denis Khlopin on 07.05.2020.
//  Copyright © 2020 Anastasia Legert. All rights reserved.
//

import UIKit

class ProfileListRouter {
    weak var navigationController: UINavigationController?
    
    // 1) через window
    static func start(window: UIWindow) {
        guard   let configurator = ProfileListConfigurator(),
            let viewController = configurator.viewController,
            let router = configurator.router
            else {
                return
        }
        
        let navigationController = UINavigationController(rootViewController: viewController)
        router.navigationController = navigationController
        
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
    }
    
    // 2) через NavigationController
    static func push(navigationController: UINavigationController, animated: Bool = true) {
        guard   let configurator = ProfileListConfigurator(),
            let viewController = configurator.viewController,
            let router = configurator.router
            
            else {
                return
        }
        router.navigationController = navigationController
        
        navigationController.pushViewController(viewController, animated: animated)
    }
    
    // 3) через present поверх контроллера
    static func present(parentViewController: UIViewController, animated: Bool = true) {
        guard   let configurator = ProfileListConfigurator(),
            let viewController = configurator.viewController
            else {
                return
        }
        
        viewController.modalPresentationStyle = .fullScreen
        
        parentViewController.present(viewController, animated: animated) {
            //
        }
    }
    
    func routeToEditProfile(editedProfile: Profile, pathToEditedProfile: String) {
        if let navigationController = self.navigationController {
            EditProfileRouter.push(
                navigationController: navigationController,
                editedProfile: editedProfile,
                pathToEditedProfile: pathToEditedProfile)
        }
    }
    
    func routeToAddNewProfile(pathToDataBase: String) {
        if let navigationController = self.navigationController {
            AddProfileRouter.push(
                navigationController: navigationController,
                pathToDataBase: pathToDataBase)
        }
    }
    
    func routeToDetailProfile(profile: Profile, pathToDataBase: String) {
        if let navigationController = self.navigationController {
            ProfileRouter.push(
                navigationController: navigationController,
                profile: profile,
                pathToPreviousLevel: pathToDataBase)
        }
    }
}

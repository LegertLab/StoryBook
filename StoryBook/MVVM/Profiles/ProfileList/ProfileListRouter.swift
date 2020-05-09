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
    
    func routeToEdit(profile: Profile, pathToDataBase: String) {
        
        guard
            let profileEditController = UIStoryboard(name: "Main", bundle: nil)
            .instantiateViewController(withIdentifier: "EditProfileVC") as? EditProfileVC,
            let navigationController = self.navigationController
        else {
                return
        }
        profileEditController.editedItem = profile
        profileEditController.pathToEditedItem = "\(pathToDataBase)/\(profile.documentID)"
        
        navigationController.pushViewController(profileEditController, animated: true)
    }
    
    func routeToAddNewProfile(pathToDataBase: String) {
//        guard
//            let profileAddController = UIStoryboard(name: "AddProfile", bundle: nil)
//            .instantiateViewController(withIdentifier: "AddProfileVC") as? AddProfileVC,
//            let navigationController = self.navigationController
//        else {
//                return
//        }
//        profileAddController.pathToEditedCollection = "\(pathToDataBase)"
//        
//        navigationController.pushViewController(profileEditController, animated: true)
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

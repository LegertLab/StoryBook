//
//  ProfileListConfigurator.swift
//  StoryBook
//
//  Created by Denis Khlopin on 07.05.2020.
//  Copyright © 2020 Anastasia Legert. All rights reserved.
//

import UIKit

class ProfileListConfigurator {
    
    weak var viewController: ProfileListVC?
    weak var router: ProfileListRouter?
    
    init?(/* входные параметры*/){
        let viewModel = ProfileListViewModel()
        let router = ProfileListRouter()
        viewModel.router = router
        guard let viewController = UIStoryboard(name: "Main", bundle: nil)
            .instantiateViewController(withIdentifier: "ListOfProfilesVC") as? ProfileListVC
            else {
                return nil
        }
        viewController.viewModel = viewModel
        self.viewController = viewController
        self.router = router
    }
}

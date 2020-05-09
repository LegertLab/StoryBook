//
//  ProfileConfigurator.swift
//  StoryBook
//
//  Created by Denis Khlopin on 07.05.2020.
//  Copyright © 2020 Anastasia Legert. All rights reserved.
//

import UIKit

class ProfileConfigurator {
    
    weak var viewController: ProfileVC?

    init?(profile: Profile, pathToPreviousLevel: String){
        let viewModel = ProfileViewModel(profile: profile, pathToPreviousLevel: pathToPreviousLevel)
        let router = ProfileRouter()
        viewModel.router = router
        guard let viewController = UIStoryboard(name: "Main", bundle: nil)
            .instantiateViewController(withIdentifier: "ProfileVC") as? ProfileVC else {
                return nil
        }
        viewController.viewModel = viewModel
        self.viewController = viewController
    }
}

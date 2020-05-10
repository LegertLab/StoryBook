//
//  EditProfileConfigurator.swift
//  StoryBook
//
//  Created by Anastasia Legert on 9/5/20.
//  Copyright © 2020 Anastasia Legert. All rights reserved.
//

import UIKit

class EditProfileConfigurator {
    
    weak var viewController: EditProfileVC?

    init?(editedProfile: Profile, pathToEditedProfile: String){
        let viewModel = EditProfileViewModel(
            editedProfile: editedProfile,
            pathToEditedProfile: pathToEditedProfile
        )
        let router = EditProfileRouter()
        viewModel.router = router
        guard let viewController = UIStoryboard(name: "EditProfile", bundle: nil)
            .instantiateViewController(withIdentifier: "EditProfileVC") as? EditProfileVC else {
                return nil
        }
        viewController.viewModel = viewModel
        self.viewController = viewController
    }
}


//
//  EditSubsectionConfigurator.swift
//  StoryBook
//
//  Created by Anastasia Legert on 11/5/20.
//  Copyright © 2020 Anastasia Legert. All rights reserved.
//

import UIKit

class EditSubsectionConfigurator {
    
    weak var viewController: EditSubsectionVC?

    init?(editedSubsection: Section, pathToEditedSubsection: String){
        let viewModel = EditSubsectionViewModel(editedSubsection: editedSubsection, pathToEditedSubsection: pathToEditedSubsection)
        let router = EditSubsectionRouter()
        viewModel.router = router
        guard let viewController = UIStoryboard(name: "EditSubsection", bundle: nil)
            .instantiateViewController(withIdentifier: "EditSubsectionVC") as? EditSubsectionVC else {
                return nil
        }
        viewController.viewModel = viewModel
        self.viewController = viewController
    }
}


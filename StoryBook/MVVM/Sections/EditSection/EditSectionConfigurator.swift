//
//  EditSectionConfigurator.swift
//  StoryBook
//
//  Created by Anastasia Legert on 10/5/20.
//  Copyright © 2020 Anastasia Legert. All rights reserved.
//

import UIKit

class EditSectionConfigurator {
    
    weak var viewController: EditSectionVC?

    init?(editedSection: Section, pathToEditedSection: String){
        let viewModel = EditSectionViewModel(editedSection: editedSection, pathToEditedSection: pathToEditedSection)
        let router = EditSectionRouter()
        viewModel.router = router
        guard let viewController = UIStoryboard(name: "EditSection", bundle: nil)
            .instantiateViewController(withIdentifier: "EditSectionVC") as? EditSectionVC else {
                return nil
        }
        viewController.viewModel = viewModel
        self.viewController = viewController
    }
}


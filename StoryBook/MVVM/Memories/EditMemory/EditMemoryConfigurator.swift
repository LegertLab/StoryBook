//
//  EditMemoryConfigurator.swift
//  StoryBook
//
//  Created by Anastasia Legert on 11/5/20.
//  Copyright © 2020 Anastasia Legert. All rights reserved.
//

import UIKit

class EditMemoryConfigurator {
    
    weak var viewController: EditMemoryVC?

    init?(editedMemory: Memory, pathToEditedMemory: String){
        let viewModel = EditMemoryViewModel(editedMemory: editedMemory, pathToEditedMemory: pathToEditedMemory)
        let router = EditMemoryRouter()
        viewModel.router = router
        guard let viewController = UIStoryboard(name: "EditMemory", bundle: nil)
            .instantiateViewController(withIdentifier: "EditMemoryVC") as? EditMemoryVC else {
                return nil
        }
        viewController.viewModel = viewModel
        self.viewController = viewController
    }
}


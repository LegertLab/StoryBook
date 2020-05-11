//
//  AddMemory.swift
//  StoryBook
//
//  Created by Anastasia Legert on 11/5/20.
//  Copyright © 2020 Anastasia Legert. All rights reserved.
//

import UIKit

class AddMemoryConfigurator {
    
    weak var viewController: AddMemoryVC?
    
    init?(pathToDataBase: String){
        let viewModel = AddMemoryViewModel(pathToDataBase: pathToDataBase)
        let router = AddMemoryRouter()
        viewModel.router = router
        guard let viewController = UIStoryboard(name: "AddMemory", bundle: nil)
            .instantiateViewController(withIdentifier: "AddMemoryVC") as? AddMemoryVC else {
                return nil
        }
        viewController.viewModel = viewModel
        self.viewController = viewController
    }
}

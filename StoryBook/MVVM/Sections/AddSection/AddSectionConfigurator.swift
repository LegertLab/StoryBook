//
//  AddSectionConfigurator.swift
//  StoryBook
//
//  Created by Anastasia Legert on 10/5/20.
//  Copyright © 2020 Anastasia Legert. All rights reserved.
//

import UIKit

class AddSectionConfigurator {
    
    weak var viewController: AddSectionVC?
    
    init?(pathToDataBase: String){
        let viewModel = AddSectionViewModel(pathToDataBase: pathToDataBase)
        let router = AddSectionRouter()
        viewModel.router = router
        guard let viewController = UIStoryboard(name: "AddSection", bundle: nil)
            .instantiateViewController(withIdentifier: "AddSectionVC") as? AddSectionVC else {
                return nil
        }
        viewController.viewModel = viewModel
        self.viewController = viewController
    }
}

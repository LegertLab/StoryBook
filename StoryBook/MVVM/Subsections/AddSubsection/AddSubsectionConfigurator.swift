//
//  AddSubsectionConfigurator.swift
//  StoryBook
//
//  Created by Anastasia Legert on 11/5/20.
//  Copyright © 2020 Anastasia Legert. All rights reserved.
//

import UIKit

class AddSubsectionConfigurator {
    
    weak var viewController: AddSubsectionVC?
    
    init?(pathToDataBase: String){
        let viewModel = AddSubsectionViewModel(pathToDataBase: pathToDataBase)
        let router = AddSubsectionRouter()
        viewModel.router = router
        guard let viewController = UIStoryboard(name: "AddSubsection", bundle: nil)
            .instantiateViewController(withIdentifier: "AddSubsectionVC") as? AddSubsectionVC else {
                return nil
        }
        viewController.viewModel = viewModel
        self.viewController = viewController
    }
}

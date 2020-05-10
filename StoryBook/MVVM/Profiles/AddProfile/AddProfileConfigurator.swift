//
//  AddProfileConfigurator.swift
//  StoryBook
//
//  Created by Anastasia Legert on 9/5/20.
//  Copyright © 2020 Anastasia Legert. All rights reserved.
//

import UIKit

class AddProfileConfigurator {
    
    weak var viewController: AddProfileVC?
    
    init?(pathToDataBase: String){
        let viewModel = AddProfileViewModel(pathToDataBase: pathToDataBase)
        let router = AddProfileRouter()
        viewModel.router = router
        guard let viewController = UIStoryboard(name: "AddProfile", bundle: nil)
            .instantiateViewController(withIdentifier: "AddProfileVC") as? AddProfileVC else {
                return nil
        }
        viewController.viewModel = viewModel
        self.viewController = viewController
    }
}

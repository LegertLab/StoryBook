//
//  SubsectionConfigurator.swift
//  StoryBook
//
//  Created by Anastasia Legert on 10/5/20.
//  Copyright © 2020 Anastasia Legert. All rights reserved.
//

import UIKit

class SubsectionConfigurator {
    
    weak var viewController: SubsectionVC?
    
    init?(subsection: Section, pathToPreviousLevel: String){
        let viewModel = SubsectionViewModel(subsection: subsection, pathToPreviousLevel: pathToPreviousLevel)
        let router = SubsectionRouter()
        viewModel.router = router
        guard let viewController = UIStoryboard(name: "Subsection", bundle: nil)
            .instantiateViewController(withIdentifier: "SubsectionVC") as? SubsectionVC else {
                return nil
        }
        viewController.viewModel = viewModel
        self.viewController = viewController
    }
}

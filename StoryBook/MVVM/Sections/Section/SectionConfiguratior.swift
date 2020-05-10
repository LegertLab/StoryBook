//
//  SectionConfiguratior.swift
//  StoryBook
//
//  Created by Anastasia Legert on 10/5/20.
//  Copyright © 2020 Anastasia Legert. All rights reserved.
//

import UIKit

class SectionConfigurator {
    
    weak var viewController: SectionVC?
    
    init?(section: Section, pathToPreviousLevel: String){
        let viewModel = SectionViewModel(section: section, pathToPreviousLevel: pathToPreviousLevel)
        let router = SectionRouter()
        viewModel.router = router
        guard let viewController = UIStoryboard(name: "Section", bundle: nil)
            .instantiateViewController(withIdentifier: "SectionVC") as? SectionVC else {
                return nil
        }
        viewController.viewModel = viewModel
        self.viewController = viewController
    }
}

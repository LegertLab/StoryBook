//
//  ProfileCellConfigurator.swift
//  StoryBook
//
//  Created by Denis Khlopin on 11.05.2020.
//  Copyright © 2020 Anastasia Legert. All rights reserved.
//

import Foundation

class ProfileCellConfigurator {
    var cell: ProfileTableViewCell
    
    init(cell: ProfileTableViewCell, profile: Profile) {
        let viewModel = ProfileCellViewModel(profile: profile)
        cell.viewModel = viewModel
        self.cell = cell
    }
}

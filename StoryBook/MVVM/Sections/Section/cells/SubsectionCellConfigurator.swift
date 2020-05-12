//
//  SubsectionCellConfigurator.swift
//  StoryBook
//
//  Created by Anastasia Legert on 12/5/20.
//  Copyright © 2020 Anastasia Legert. All rights reserved.
//

import Foundation

class SubsectionCellConfigurator {
    var cell: SubsectionCell
    
    init(cell: SubsectionCell, subsection: Section) {
        let viewModel = SubsectionCellViewModel(subsection: subsection)
        cell.viewModel = viewModel
        self.cell = cell
    }
}

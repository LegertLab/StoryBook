//
//  SectionCellConfigurator.swift
//  StoryBook
//
//  Created by Anastasia Legert on 12/5/20.
//  Copyright © 2020 Anastasia Legert. All rights reserved.
//

import Foundation

class SectionCellConfigurator {
    var cell: SectionCell
    
    init(cell: SectionCell, section: Section) {
        let viewModel = SectionCellViewModel(section: section)
        cell.viewModel = viewModel
        self.cell = cell
    }
}

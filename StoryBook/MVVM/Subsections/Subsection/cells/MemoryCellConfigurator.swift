//
//  MemoryCellConfigurator.swift
//  StoryBook
//
//  Created by Anastasia Legert on 12/5/20.
//  Copyright © 2020 Anastasia Legert. All rights reserved.
//

import Foundation

class MemoryCellConfigurator {
    var cell: MemoryCell
    
    init(cell: MemoryCell, memory: Memory) {
        let viewModel = MemoryCellViewModel(memory: memory)
        cell.viewModel = viewModel
        self.cell = cell
    }
}

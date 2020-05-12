//
//  ShowProfileVC2.swift
//  StoryBook
//
//  Created by Anastasia Legert on 22/4/20.
//  Copyright © 2020 Anastasia Legert. All rights reserved.
//

import UIKit

class ProfileVC: UITableViewController {
    
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var kinshipLabel: UILabel!
    @IBOutlet weak var dateOfBirthLabel: UILabel!
    
    var viewModel: ProfileViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameLabel.text = viewModel?.profile.name
        kinshipLabel.text = viewModel?.profile.kinship
        dateOfBirthLabel.text = viewModel?.profile.dateOfBirth
        
        guard let viewModel = viewModel else {
            return
        }
        
        viewModel.observeQuery { [weak self] (sections) in
            guard let self = self else { return }
            self.tableView.reloadData()
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if let selectedIndexPath = tableView.indexPathForSelectedRow {
            tableView.deselectRow(at: selectedIndexPath, animated: animated)
        }
    }
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let viewModel = viewModel else {
            return 0
        }
        return viewModel.sections.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let viewModel = viewModel else {
            return UITableViewCell()
        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! SectionCell
        
        let section = viewModel.sections[indexPath.row]
        
        let configurator = SectionCellConfigurator(cell: cell, section: section)
        return configurator.cell
        
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        guard let viewModel = viewModel else {
            fatalError()
        }
        
        let sectionIndex = indexPath.row
        let deleteAction = UIContextualAction(style: .destructive, title: "Удалить") {  (contextualAction, view, boolValue) in
            viewModel.deleteSection(by: sectionIndex)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
        
        let editAction = UIContextualAction(style: .normal, title: "Изменить", handler: {
            (ac:UIContextualAction, view:UIView, success:(Bool) -> Void) in
            viewModel.routeToEditSection(by: sectionIndex)
            success(true)
        })
        
        let swipeActions = UISwipeActionsConfiguration(actions: [deleteAction, editAction])
        
        return swipeActions
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let viewModel = viewModel else {
            fatalError()
        }
        let sectionIndex = indexPath.row
        viewModel.routeToDetailSection(by: sectionIndex)
    }
    
    @IBAction func AddTappedButton(_ sender: UIButton) {
        guard let viewModel = viewModel else {
            fatalError()
        }
        viewModel.routeToAddNewSection()
    }
}

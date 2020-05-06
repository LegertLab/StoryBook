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
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! SectionTableViewCell

        let itemOfList = viewModel.sections[indexPath.row]
        cell.sectionImage.image = UIImage(named: "section")
        cell.titleLabel.text = itemOfList.title
        return cell
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }

    
    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        guard let viewModel = viewModel else {
            fatalError()
        }
        
        let profileIndex = indexPath.row
        let itemOfList = viewModel.sections[profileIndex]
        let deleteAction = UIContextualAction(style: .destructive, title: "Удалить") {  (contextualAction, view, boolValue) in
        viewModel.delete(by: profileIndex)
        tableView.deleteRows(at: [indexPath], with: .automatic)
        }
        
        let editAction = UIContextualAction(style: .normal, title: "Изменить", handler: {
         (ac:UIContextualAction, view:UIView, success:(Bool) -> Void) in
             viewModel.edit(by: profileIndex)
            self.performSegue(withIdentifier: "editSection", sender: itemOfList)
            success(true)
        })
        
        let swipeActions = UISwipeActionsConfiguration(actions: [deleteAction, editAction])

        return swipeActions
    }
    
    
    
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let viewModel = self.viewModel else {
            fatalError()
        }
        
        if segue.identifier == "showDetails" {
            if let indexPath = self.tableView.indexPathForSelectedRow {
                let showDetailsVC = segue.destination as! SectionVC
                let sectionViewModel = SectionViewModel(
                    section: viewModel.sections[indexPath.row],
                    pathToPreviousLevel: viewModel.pathToDataBase
                    )
                showDetailsVC.viewModel = sectionViewModel
            }
        } else if segue.identifier == "editProfile" {
            let editVC = segue.destination as! EditProfileVC
            editVC.editedItem = viewModel.profile
            editVC.pathToEditedItem = "\(viewModel.pathToPreviousLevel)/\(viewModel.profile.documentID)"
        } else if segue.identifier == "create" {
            let createVC = segue.destination as! CreateSectionVC
            createVC.pathToEditedCollection = viewModel.pathToDataBase
        } else if segue.identifier == "editSection" {
            let editedItem = sender as! Section
                let editSectionVC = segue.destination as! EditSectionVC
                editSectionVC.editedItem = editedItem
            editSectionVC.pathToEditedItem = "\(viewModel.pathToDataBase)/\(editedItem.documentID)"
            }
        }
    }

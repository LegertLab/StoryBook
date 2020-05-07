//
//  ShowSectionVCNew.swift
//  StoryBook
//
//  Created by Anastasia Legert on 23/4/20.
//  Copyright © 2020 Anastasia Legert. All rights reserved.
//

import UIKit
import Firebase

class SectionVC: UITableViewController {
    
    var viewModel: SectionViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = viewModel!.section.title
        
        guard let viewModel = viewModel else {
            return
        }
        
        viewModel.observeQuery { [weak self] (subsections) in
            guard let self = self else { return }
            self.tableView.reloadData()
        }
    }
    
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let viewModel = viewModel else {
            return 0
        }
        return viewModel.subsections.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let viewModel = viewModel else {
            return UITableViewCell()
        }
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! SectionTableViewCell
        
        let itemOfList = viewModel.subsections[indexPath.row]
        cell.titleLabel.text = itemOfList.title
        cell.sectionImage.image = UIImage(named: "section")
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    
    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        guard let viewModel = viewModel else {
            fatalError()
        }
        let subsectionIndex = indexPath.row
        let itemOfList = viewModel.subsections[subsectionIndex]
        let deleteAction = UIContextualAction(style: .destructive, title: "Удалить") {  (contextualAction, view, boolValue) in
        viewModel.delete(by: subsectionIndex)
        tableView.deleteRows(at: [indexPath], with: .automatic)
            
        }
        let editAction = UIContextualAction(style: .normal, title: "Изменить", handler: {
            (ac:UIContextualAction, view:UIView, success:(Bool) -> Void) in
            self.performSegue(withIdentifier: "editSubsection", sender: itemOfList)
            success(true)
        })
        let swipeActions = UISwipeActionsConfiguration(actions: [deleteAction, editAction])
        return swipeActions
    }
    
    
    // MARK: - Navigation
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == "showMore" {
//            if let indexPath = self.tableView.indexPathForSelectedRow {
//                let showMoreVC = segue.destination as! ShowSubsectionVC
//                showMoreVC.itemOfList = currentList[indexPath.row]
//                showMoreVC.pathToPreviousItem = pathToDataBase
//            }
//        } else if segue.identifier == "create" {
//            let createVC = segue.destination as! CreateSubsectionVC
//            createVC.pathToEditedCollection = pathToDataBase
//        } else if segue.identifier == "editSubsection" {
//            let editedItem = sender as! Section
//            let editSubsectionVC = segue.destination as! EditSubsectionVC
//            editSubsectionVC.editedItem = editedItem
//            editSubsectionVC.pathToEditedItem = "\(self.pathToDataBase)/\(editedItem.documentID)"
//        }
//    }
}



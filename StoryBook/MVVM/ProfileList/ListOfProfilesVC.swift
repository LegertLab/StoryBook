//
//  ListOfProfilesVCNewTableViewController.swift
//  StoryBook
//
//  Created by Anastasia Legert on 22/4/20.
//  Copyright © 2020 Anastasia Legert. All rights reserved.
//

import UIKit


class ProfileListVC: UITableViewController {

    var viewModel: ProfileListViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()


        guard let viewModel = viewModel else {
            return
        }
        
        viewModel.observeQuery { [weak self] (profiles) in
            guard let self = self else { return }
            self.tableView.reloadData()
        }
        
    }
    func initViewModel(viewModel: ProfileListViewModel) {
        self.viewModel = viewModel
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    



    
    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let viewModel = viewModel else {
            return 0
        }
        return viewModel.profiles.count
    }

   override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let viewModel = viewModel else {
            return UITableViewCell()
        }
    
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! ProfileTableViewCell

        let itemOfList = viewModel.profiles[indexPath.row]
        
        cell.kinshipLabel.text = itemOfList.kinship
        cell.nameLabel.text = itemOfList.name
        cell.profileImage.image = UIImage(named: "mom")
        cell.profileImage.layer.cornerRadius = cell.profileImage.frame.size.height / 2
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
        let deleteAction = UIContextualAction(style: .destructive, title: "Удалить") {  (contextualAction, view, boolValue) in
            viewModel.delete(by: profileIndex)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
        let editAction = UIContextualAction(style: .normal, title: "Изменить", handler: {
         (ac:UIContextualAction, view:UIView, success:(Bool) -> Void) in
            viewModel.edit(by: profileIndex)
            self.performSegue(withIdentifier: "editProfile", sender: viewModel.profiles[indexPath.row])
 
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
                let showDetailsVC = segue.destination as! ProfileVC
                let profileViewModel = ProfileViewModel(
                    profile: viewModel.profiles[indexPath.row],
                    pathToPreviousLevel: viewModel.pathToDataBase
                )
                showDetailsVC.viewModel = profileViewModel
            }
        }  else if segue.identifier == "createNewItem" {
            let createVC = segue.destination as! CreateProfileVC
            createVC.pathToEditedCollection = viewModel.pathToDataBase
        } else if segue.identifier == "editProfile" {
        let editedItem = sender as! Profile
            let editProfileVC = segue.destination as! EditProfileVC
            editProfileVC.editedItem = editedItem
            editProfileVC.pathToEditedItem = "\(viewModel.pathToDataBase)/\(editedItem.documentID)"
        }
    }
}

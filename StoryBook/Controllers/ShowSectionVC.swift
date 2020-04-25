//
//  ShowSectionVCNew.swift
//  StoryBook
//
//  Created by Anastasia Legert on 23/4/20.
//  Copyright © 2020 Anastasia Legert. All rights reserved.
//

import UIKit
import Firebase

class ShowSectionVC: UITableViewController {
    
    let db = Firestore.firestore()
    var pathToPreviousItem = ""
    var pathToDataBase = ""
    var itemOfList = Section(title: "", documentID: "")
    var currentList: [Section] = []
    var listener: ListenerRegistration?
    var query: Query?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = itemOfList.title
        
        pathToDataBase = getPathToDataBase()
        query = baseQuery()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        observeQuery()
    }
    
    func getPathToDataBase() -> String {
        return "\(pathToPreviousItem)/\(itemOfList.documentID)/subsections"
        
    }
    
    func baseQuery() -> Query {
        return db.collection(pathToDataBase)
    }
    
    func observeQuery() {
        guard let query = query else { return }
        listener = query.addSnapshotListener { (snapshot, error) in
            guard let snapshot = snapshot else { return }
            let models = snapshot.documents.map { (document) -> Section in
                if let model = Section(dictionary: document.data(), documentID: document.documentID) {
                    return model
                } else {
                    //Don't use fatalError here in a real app.
                    fatalError("Unable to initialize type \(Section.self) with dictionary \(document.data())")
                }
            }
            self.currentList = models
            self.tableView.reloadData()
        }
        
    }
    
    
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return currentList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! SectionTableViewCell
        
        let itemOfList = currentList[indexPath.row]
        cell.titleLabel.text = itemOfList.title
        cell.sectionImage.image = UIImage(named: "section")
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    
    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let itemOfList = currentList[indexPath.row]
        let deleteAction = UIContextualAction(style: .destructive, title: "Удалить") {  (contextualAction, view, boolValue) in
            let deletedDocID = itemOfList.documentID
            
            self.db.document("\(self.pathToDataBase)/\(deletedDocID)").delete()
            self.currentList.remove(at: indexPath.row)
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
    
    //self.currentList[indexPath.row]
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showMore" {
            if let indexPath = self.tableView.indexPathForSelectedRow {
                let showMoreVC = segue.destination as! ShowSubsectionVC
                showMoreVC.itemOfList = currentList[indexPath.row]
                showMoreVC.pathToPreviousItem = pathToDataBase
            }
        } else if segue.identifier == "create" {
            let createVC = segue.destination as! CreateSubsectionVC
            createVC.pathToEditedCollection = pathToDataBase
        } else if segue.identifier == "editSubsection" {
            let editedItem = sender as! Section
            let editSubsectionVC = segue.destination as! EditSubsectionVC
            editSubsectionVC.editedItem = editedItem
            editSubsectionVC.pathToEditedItem = "\(self.pathToDataBase)/\(editedItem.documentID)"
        }
    }
}



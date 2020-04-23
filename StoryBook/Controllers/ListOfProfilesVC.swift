//
//  ListOfProfilesVCNewTableViewController.swift
//  StoryBook
//
//  Created by Anastasia Legert on 22/4/20.
//  Copyright © 2020 Anastasia Legert. All rights reserved.
//

import UIKit
import Firebase


class ListOfProfilesVC: UITableViewController, CreateProfileViewControllerDelegate { // нужный протокол подключить для приема созданного объекта

    let db = Firestore.firestore()
    var pathToPreviousItem = "users/testUser"
    var pathToDataBase = ""
    var currentList: [Profile] = []          //нужно вносить эту переменную с нужным типом                                                              данных для каждого класса
    var listener: ListenerRegistration?
    var query: Query?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        db.clearPersistence(completion: { Error in
             print("Could not enable persistence")
        })
        
        pathToDataBase = getPathToDataBase()
        query = baseQuery()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        observeQuery()
    }
    
    func getPathToDataBase() -> String {
        return "\(pathToPreviousItem)/profiles"          // нужно менять окончание адреса для                                                                   каждого класса
    }
    
    func baseQuery() -> Query {
        return db.collection(pathToDataBase)
     }
    
    func update(newItem: Profile) {     //заменить тип данных для других классов
        currentList.append(newItem)
    }

    func observeQuery() {                       //заменить тип данных для других классов
      guard let query = query else { return }
      listener = query.addSnapshotListener { (snapshot, error) in
        guard let snapshot = snapshot else { return }
        let models = snapshot.documents.map { (document) -> Profile in
            if let model = Profile(dictionary: document.data(), documentID: document.documentID) {
            return model
          } else {
            //Don't use fatalError here in a real app.
        fatalError("Unable to initialize type \(Profile.self) with dictionary \(document.data())")
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

    // Меняем cell под каждый класс
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! ProfileTableViewCell

        let itemOfList = currentList[indexPath.row]
        
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
        
        let itemOfList = currentList[indexPath.row]
        let deleteAction = UIContextualAction(style: .destructive, title: "Удалить") {  (contextualAction, view, boolValue) in
        let deletedDocID = itemOfList.documentID
           
        self.db.document("\(self.pathToDataBase)/\(deletedDocID)").delete()
        self.currentList.remove(at: indexPath.row)
        tableView.deleteRows(at: [indexPath], with: .automatic)
            
        }
        let swipeActions = UISwipeActionsConfiguration(actions: [deleteAction])

        return swipeActions
    }
    
    
    
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetails" {
            if let indexPath = self.tableView.indexPathForSelectedRow {
                let showDetailsVC = segue.destination as! ShowProfileVC     // менять кастомный                                                                           класс для каждого класса
                showDetailsVC.itemOfList = currentList[indexPath.row]
                showDetailsVC.pathToPreviousItem = pathToDataBase
            }
        }
    }
}

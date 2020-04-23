//
//  ShowProfileVC2.swift
//  StoryBook
//
//  Created by Anastasia Legert on 22/4/20.
//  Copyright © 2020 Anastasia Legert. All rights reserved.
//

import UIKit
import Firebase

class ShowProfileVC: UITableViewController, CreateSectionViewControllerDelegate {
    
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var kinshipLabel: UILabel!

    let db = Firestore.firestore()
    var pathToPreviousItem = "" //String {
//        get { return "" }
//        set { "" }
//    }
    var pathToDataBase = ""
    var itemOfList = Profile(name: "", kinship: "", dateOfBirth: "", documentID: "")
    var currentList: [Section] = []          //нужно вносить эту переменную с нужным типом                                                         данных для каждого класса
    var listener: ListenerRegistration?
    var query: Query?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        db.clearPersistence(completion: { Error in
             print("Could not enable persistence")
        })

        pathToDataBase = getPathToDataBase()
        query = baseQuery()
        nameLabel.text = itemOfList.name
        kinshipLabel.text = itemOfList.kinship
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        observeQuery()
    }
    
    func update(newItem: Section) {
        self.currentList.append(newItem)
    }
    
    func getPathToDataBase() -> String {
        return "\(pathToPreviousItem)/\(itemOfList.documentID)/sections"          // нужно менять окончание адреса для                                                                   каждого класса
    }
    
    func baseQuery() -> Query {
        return db.collection(pathToDataBase)
     }
    

    func observeQuery() {                       //заменить тип данных для других классов
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

    // Меняем cell под каждый класс
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! SectionTableViewCell

        let itemOfList = currentList[indexPath.row]
        cell.sectionImage.image = UIImage(named: "section")
        cell.titleLabel.text = itemOfList.title
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
        if segue.identifier == "showMore" {
            if let indexPath = self.tableView.indexPathForSelectedRow {
                let showMoreVC = segue.destination as! ShowSectionVC
                showMoreVC.itemOfList = currentList[indexPath.row]
                showMoreVC.pathToPreviousItem = pathToDataBase
            }
        }
    }
}

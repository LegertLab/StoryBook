//
//  ListOfProfilesTableViewController.swift
//  StoryBook
//
//  Created by Anastasia Legert on 8/4/20.
//  Copyright © 2020 Anastasia Legert. All rights reserved.
//

import UIKit
import Firebase

protocol MainViewControllerDelegate: class {
    func update(newProfile: Profile)
}

class ListOfProfilesVC: UITableViewController, MainViewControllerDelegate {

    let db = Firestore.firestore()
    var currentUser: String = "testUser"
    var pathToDataBase = ""
    var profiles: [Profile] = []
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
        return "users/\(currentUser)/profiles"
    }
    
    func baseQuery() -> Query {
        return db.collection(pathToDataBase)
     }
    
    func update(newProfile: Profile) {
        profiles.append(newProfile)
    }

    func observeQuery() {
      guard let query = query else { return }
        // ?? Разобраться, как создавать addSnapshotListener без параметров, как ниже
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
        self.profiles = models
    
        //self.documents = snapshot.documents

        self.tableView.reloadData()
      }

    }
    

    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return profiles.count
        
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! ProfileTableViewCell

        let profile = profiles[indexPath.row]
        cell.kinshipLabel.text = profile.kinship
        cell.nameLabel.text = profile.name
        cell.profileImage.image = UIImage(named: "mom")
        cell.profileImage.layer.cornerRadius = cell.profileImage.frame.size.height / 2

        return cell
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }

    
        override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let profile = profiles[indexPath.row]
        let deleteAction = UIContextualAction(style: .destructive, title: "Удалить") {  (contextualAction, view, boolValue) in
        let deletedDocID = profile.documentID
           
            print(self.db.document("\(self.pathToDataBase)/\(deletedDocID)"))
            self.db.document("\(self.pathToDataBase)/\(deletedDocID)").delete()
            self.profiles.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
            
        }
        let swipeActions = UISwipeActionsConfiguration(actions: [deleteAction])

        return swipeActions
    }
    
    
    
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowProfile" {
            if let indexPath = self.tableView.indexPathForSelectedRow {
                let showProfileVC = segue.destination as! ShowProfileVC
                showProfileVC.profile = profiles[indexPath.row]
                showProfileVC.pathToProfiles = pathToDataBase
            }
        }
    }


    @IBAction func addProfileTapped(_ sender: UIBarButtonItem) {

    }
}

//
//  ListOfProfilesTableViewController.swift
//  StoryBook
//
//  Created by Anastasia Legert on 8/4/20.
//  Copyright © 2020 Anastasia Legert. All rights reserved.
//

import UIKit
import Firebase

class ListOfProfilesTableViewController: UITableViewController {

    //var docRef: DocumentReference!
    var profiles: [Profile] = []
    var documents: [DocumentSnapshot] = []
    var listener: ListenerRegistration?
    var query: Query?
    var collRef: CollectionReference?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Firestore.firestore().clearPersistence(completion: { Error in
             print("Could not enable persistence")
        })
        
        query = baseQuery()
        collRef = baseQuery() as? CollectionReference
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        observeQuery()
    }
    
    func baseQuery() -> Query {
        return Firestore.firestore().collection("users/testUser/profiles")
        //return Firestore.firestore().document("users/testUser")
     }
    
    func observeQuery() {
      guard let query = query else { return }
        // ?? Разобраться, как создавать addSnapshotListener без параметров, как ниже
      listener = query.addSnapshotListener { (snapshot, error) in
        guard let snapshot = snapshot else { return }
        let models = snapshot.documents.map { (document) -> Profile in
            //print(document.documentID)
            //print(document.data())
            if let model = Profile(dictionary: document.data(), documentID: document.documentID) {
            return model
          } else {
            //Don't use fatalError here in a real app.
        fatalError("Unable to initialize type \(Profile.self) with dictionary \(document.data())")
        }
        }
        self.profiles = models
        self.documents = snapshot.documents

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

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */
//    override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
//        let deleteAction = UITableViewRowAction(style: .default, title: "Delete") { (_, _) in
//            self.profiles.remove(at: indexPath.row)
//            tableView.deleteRows(at: [indexPath], with: .automatic)
//            }
//
//               return [deleteAction]
//    }

    
        override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let profile = profiles[indexPath.row]
        let deleteAction = UIContextualAction(style: .destructive, title: "Удалите") {  (contextualAction, view, boolValue) in
       let deletedDocID = profile.documentID
           print(deletedDocID)
            print(Firestore.firestore().document("users/testUser/profiles/\(deletedDocID)"))
            Firestore.firestore().document("users/testUser/profiles/\(deletedDocID)").delete()
//            Firestore.firestore().clearPersistence(completion: { Error in
//                 print("Could not enable persistence")
//            })
            //self.tableView.reloadData()
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
            }
        }
    }


    @IBAction func addProfileTapped(_ sender: UIBarButtonItem) {
        
    }
}

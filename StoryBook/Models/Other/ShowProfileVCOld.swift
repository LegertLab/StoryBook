//
//  ShowProfileVC.swift
//  StoryBook
//
//  Created by Anastasia Legert on 9/4/20.
//  Copyright © 2020 Anastasia Legert. All rights reserved.
//

import UIKit
import Firebase


class ShowProfileVCOld: UITableViewController {
    
    var documents: [DocumentSnapshot] = []
    var listener: ListenerRegistration?
    var query: Query?
    
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var kinshipLabel: UILabel!
    
    var db = Firestore.firestore()
    var pathToPreviousItem = ""
    var itemOfList = Profile(name: "", kinship: "", dateOfBirth: "", documentID: "")
    var sections: [Section] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameLabel.text = itemOfList.name
        kinshipLabel.text = itemOfList.kinship
        query = db.collection("\(pathToPreviousItem)/\(itemOfList.documentID)/sections")
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        observeQuery()
    }
    
    func observeQuery() {
      guard let query = query else { return }
        // ?? Разобраться, как создавать addSnapshotListener без параметров, как ниже
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
        self.sections = models
        self.documents = snapshot.documents

        self.tableView.reloadData()
      }

    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return sections.count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Section", for: indexPath) as! SectionTableViewCell

        //let sections = profile.sections
        cell.sectionImage.image = UIImage(named: "section")
        cell.titleLabel.text = sections[indexPath.row].title

        return cell
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        70
    }


    // MARK: - Navigation

        override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            if segue.identifier == "editProfile" {
                let navigationVC = segue.destination as! UINavigationController
                let editProfileVC = navigationVC.children.first as! EditProfileVC
                editProfileVC.profile = itemOfList
                editProfileVC.pathToProfile = "\(pathToPreviousItem)/\(itemOfList.documentID)"
            } else if segue.identifier == "showSection" {
                if let indexPath = self.tableView.indexPathForSelectedRow {
                let showSectionVC = segue.destination as! ShowSectionVC
                    //showSectionVC.section = sections[indexPath.row]
                }
            }
        }

}

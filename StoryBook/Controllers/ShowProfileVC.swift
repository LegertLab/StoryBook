//
//  ShowProfileVC.swift
//  StoryBook
//
//  Created by Anastasia Legert on 9/4/20.
//  Copyright © 2020 Anastasia Legert. All rights reserved.
//

import UIKit


class ShowProfileVC: UITableViewController {
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var kinshipLabel: UILabel!
    
    
    var pathToProfiles = ""
    var profile = Profile(name: "", kinship: "", dateOfBirth: "", documentID: "") //sections: [])
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameLabel.text = profile.name
        kinshipLabel.text = profile.kinship

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

//    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        // #warning Incomplete implementation, return the number of rows
//        return profile.sections.count
//    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Section", for: indexPath) as! SectionTableViewCell

//        let sections = profile.sections
//        cell.sectionImage.image = UIImage(named: "section")
//        cell.titleLabel.text = sections[indexPath.row].title

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
                editProfileVC.profile = profile
                editProfileVC.pathToProfile = "\(pathToProfiles)/\(profile.documentID)"
            }
        }

}

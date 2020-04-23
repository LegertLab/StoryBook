//
//  SectionTableVC.swift
//  StoryBook
//
//  Created by Anastasia Legert on 10/4/20.
//  Copyright © 2020 Anastasia Legert. All rights reserved.
//

import UIKit

class ShowSectionVCOld: UITableViewController {

    var section = Section(title: "", documentID: "")
    var itemOfList = Section(title: "", documentID: "")
    var pathToPreviousItem: String {
        get { return "" }
        set { "" }
    }
    //var subsections: [Subsection] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = section.title
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
//        //return subsections.count
//    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Subsection", for: indexPath) as! SubsectionTableViewCell

       // cell.titleLabel.text = subsections[indexPath.row].title
        //cell.subsectionImage.image = UIImage(named: "section")

        return cell
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        70
    }


    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == "ShowMemories" {
//                  if let indexPath = self.tableView.indexPathForSelectedRow {
//                  let showMemoriesTableVC = segue.destination as! ShowMemoriesTableVC
//                    showMemoriesTableVC.memories = subsections[indexPath.row].memories
//                  }
//        }
    }
}

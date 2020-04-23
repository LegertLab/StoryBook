//
//  ShowMemoriesTableVC.swift
//  StoryBook
//
//  Created by Anastasia Legert on 10/4/20.
//  Copyright © 2020 Anastasia Legert. All rights reserved.
//

import UIKit

protocol FirstViewControllerDelegate: class {
    func update(newMemory: Memory)
}

class ShowMemoriesVCPld: UITableViewController, FirstViewControllerDelegate {

    var memories: [Memory] = []
    var itemOfList = ""
    var pathToPreviousItem = ""
    
    func update(newMemory: Memory) {
        memories.append(newMemory)
        print(memories)
    }

    
    
    override func viewDidLoad() {
        super.viewDidLoad()

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

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return memories.count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Memory", for: indexPath) as! MemoryTableViewCell
        cell.memoryImage.image = UIImage(named: "memory")
        cell.titleLabel.text = memories[indexPath.row].title
        cell.memoryImage.layer.cornerRadius = cell.memoryImage.frame.size.height / 2

        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        70
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

     //MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "MemoryItem" {
                  if let indexPath = self.tableView.indexPathForSelectedRow {
                  let showMemoryTableVC = segue.destination as! ShowMemoryVC

                    showMemoryTableVC.itemOfList = memories[indexPath.row]
                  }
        }
        if segue.identifier == "AddMemory" {
                         if let indexPath = self.tableView.indexPathForSelectedRow {
                         let createMemoryVC = segue.source as! CreateMemoryVC
                         createMemoryVC.delegate = self
                         }
               }
    }


}

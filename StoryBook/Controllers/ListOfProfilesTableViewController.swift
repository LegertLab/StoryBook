//
//  ListOfProfilesTableViewController.swift
//  StoryBook
//
//  Created by Anastasia Legert on 8/4/20.
//  Copyright © 2020 Anastasia Legert. All rights reserved.
//

import UIKit

class ListOfProfilesTableViewController: UITableViewController {

    var profiles: [Profile] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        profiles = [
//            Profile(name: "Надежда Легерт", kinship: "мама", dateOfBirth: "10 сентября 1958 г.", sections: [
//                Section(title: "Детство", subsections: [
//                    Subsection(title: "Школа", memories: []),
//                    Subsection(title: "Работа в поле", memories: [])
//                    ]),
//                Section(title: "Работа", subsections: [
//                    Subsection(title: "Завод", memories: []),
//                    Subsection(title: "Мосэнергосбыт", memories: [])
//                ]),
//               Section(title: "Поездки", subsections: ["Шевченко", "Тула"])
           // ]),
//            Profile(name: "Николай Легерт", kinship: "папа", dateOfBirth: "22 сентября 1958 г.", sections: [       Section(title: "Детство", subsections: ["Школа", "Грозный"]),
//                Section(title: "Поездки", subsections: ["Югославия", "Черное море"]),
//                Section(title: "Хобби", subsections: ["Металлоискатель", "Выращивание табака"])
//            ]),
            Profile(name: "Сергей Кюрегян", kinship: "супруг", dateOfBirth: "30 июня 1978 г.", sections: [       //Section(title: "Детство", subsections: [
               // "Школа", "Краснодар", "Походы"
            //]),
                Section(title: "Работа", subsections: [
                    Subsection(title: "Мосэнергосбыт", memories: [])
                ]),
                Section(title: "Спорт", subsections: [
                    Subsection(title: "Гольф", memories: [
                    Memory(
                        title: "Моя первая игра",
                        note: "Впервые я решил начать играть в гольф в 2012 году, и в нашей новогодней поездке во Вьетнам я взял первые уроки у местного преподавателя. И тогда я понял, что гольф - это моя судьба!",
                        dateOfMemory: "Январь 2013 года",
                        place: "Вьетнам"
                    ),
                    Memory(
                        title: "Уроки с Останкиным",
                        note: "В Крылатском я решил продолжить совершенствоваться игре в гольф, и взял со своей любимой супругой уроки у Останкина Виктора. С ним я уже на русском языке понял, как правильно держать клюшку и вообще прилично вести себя на поле.",
                        dateOfMemory: "Июнь 2013 года",
                        place: "Москва, Крылатское"
                    )
                    ]),
                    Subsection(title: "Хоккей", memories: []),
                    Subsection(title: "Большой теннис", memories: [])
                ])
            ])
        ]
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
    override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let profile = profiles[indexPath.row]
        let deleteAction = UITableViewRowAction(style: .default, title: "Delete") { (_, _) in
            self.profiles.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
            }
               
               return [deleteAction]
    }
    
//    override func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
//
//    }

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowProfile" {
            if let indexPath = self.tableView.indexPathForSelectedRow {
                let showProfileVC = segue.destination as! ShowProfileVC
                showProfileVC.profile = profiles[indexPath.row]
            }
           
        }
        
        
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }


    @IBAction func addProfileTapped(_ sender: UIBarButtonItem) {
        
    }
}

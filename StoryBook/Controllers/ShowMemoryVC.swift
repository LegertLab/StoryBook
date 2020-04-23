//
//  ShowMemoryTableVC.swift
//  StoryBook
//
//  Created by Anastasia Legert on 10/4/20.
//  Copyright © 2020 Anastasia Legert. All rights reserved.
//

import UIKit

class ShowMemoryVC: UIViewController {
    
    var itemOfList = Memory(title: "", note: "", dateOfMemory: "", place: "", documentID: "")
    var pathToPreviousItem = ""


    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var placeLabel: UILabel!
    @IBOutlet weak var notesTextField: UITextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        titleLabel.text = itemOfList.title
        dateLabel.text = itemOfList.dateOfMemory
        placeLabel.text = itemOfList.place
        notesTextField.text = itemOfList.note
    }

    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

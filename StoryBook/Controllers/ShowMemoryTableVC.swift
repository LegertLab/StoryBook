//
//  ShowMemoryTableVC.swift
//  StoryBook
//
//  Created by Anastasia Legert on 10/4/20.
//  Copyright © 2020 Anastasia Legert. All rights reserved.
//

import UIKit

class ShowMemoryTableVC: UIViewController {
    
    var memory = Memory(title: "", note: "", dateOfMemory: "", place: "")

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var placeLabel: UILabel!
    @IBOutlet weak var notesTextField: UITextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        titleLabel.text = memory.title
        dateLabel.text = memory.dateOfMemory
        placeLabel.text = memory.place
        notesTextField.text = memory.note
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

//
//  CreateProfileVC.swift
//  StoryBook
//
//  Created by Anastasia Legert on 17/4/20.
//  Copyright © 2020 Anastasia Legert. All rights reserved.
//

import UIKit

class CreateProfileVC: UIViewController {

    @IBOutlet weak var nameTextfield: UITextField!
    @IBOutlet weak var kinshipTextField: UITextField!
    @IBOutlet weak var dateOfBirthTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    
    @IBAction func cancelTapped(_ sender: UIBarButtonItem) {
                dismiss(animated: true)
    }
    
    @IBAction func saveTapped(_ sender: UIBarButtonItem) {
    }
    
}

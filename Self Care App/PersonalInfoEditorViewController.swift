//
//  PersonalInfoEditorViewController.swift
//  Self Care App
//
//  Created by Tiger Coder on 4/8/21.
//

import UIKit

class PersonalInfoEditorViewController: UIViewController {

    var userName = "N/A"
    var userAge = "N/A"
    var userPronouns = "N/A"
    
    @IBOutlet weak var userNameEnter: UITextField!
    @IBOutlet weak var userAgeEnter: UITextField!
    @IBOutlet weak var userPronounsEnter: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func saveButton(_ sender: Any) {
        userName = userNameEnter.text!
        userAge = userAgeEnter.text!
        userPronouns = userPronounsEnter.text!
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

//
//  LogInViewController.swift
//  Self Care App
//
//  Created by TEAGAN RETT on 4/11/22.
//

import UIKit

class LogInViewController: UIViewController {

    @IBOutlet weak var DisplayText: UILabel!
    @IBOutlet weak var userEnter: UITextField!
    @IBOutlet weak var passwordEnter: UITextField!
    @IBOutlet weak var enterButton: UIButton!
    @IBOutlet weak var changeSettingLabel: UILabel!
    @IBOutlet weak var changeSettingButton: UIButton!
    
    var loginCheck = true
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func changeSetting(_ sender: UIButton) {
        if(loginCheck){
            loginCheck = false
            DisplayText.text = "Create User"
            enterButton.setTitle("Create User", for: UIControl.State())
            changeSettingLabel.text = "Already have an account? Login here:"
            changeSettingButton.setTitle("Login", for: UIControl.State())
        } else{
            loginCheck = true
            DisplayText.text = "Login"
            enterButton.setTitle("Login", for: UIControl.State())
            changeSettingLabel.text = "New user? Sign up here:"
            changeSettingButton.setTitle("Create Account", for: UIControl.State())
        }
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

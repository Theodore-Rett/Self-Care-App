//
//  LogInViewController.swift
//  Self Care App
//
//  Created by TEAGAN RETT on 4/11/22.
//

import UIKit

class LogInViewController: UIViewController {
    
    @IBOutlet weak var DisplayText: UILabel!
    @IBOutlet weak var errorLabel: UILabel!
    @IBOutlet weak var userEnter: UITextField!
    @IBOutlet weak var passwordEnter: UITextField!
    @IBOutlet weak var enterButton: UIButton!
    @IBOutlet weak var changeSettingLabel: UILabel!
    @IBOutlet weak var changeSettingButton: UIButton!
    
    var loginCheck = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        errorLabel.isHidden = true
        
    }
    
    @IBAction func changeSetting(_ sender: UIButton) {
        
        //check witch mode need to switch to
        if(loginCheck){
            
            //login -> user
            loginCheck = false
            DisplayText.text = "Create User"
            enterButton.setTitle("Create User", for: UIControl.State())
            changeSettingLabel.text = "Already have an account? Login here:"
            changeSettingButton.setTitle("Login", for: UIControl.State())
        } else{
            
            //user -> login
            loginCheck = true
            DisplayText.text = "Login"
            enterButton.setTitle("Login", for: UIControl.State())
            changeSettingLabel.text = "New user? Sign up here:"
            changeSettingButton.setTitle("Create Account", for: UIControl.State())
        }
    }
    
    @IBAction func SubmitButton(_ sender: UIButton) {
        
        //updating userList
        
        let docRef2 = AppData.db.collection("User Name Lists").document("User Name Array")
        
        //getting user list from data base
        docRef2.getDocument { (document, error) in
            if let document = document, document.exists {
                let dataDescription = document.data()!
                
                AppData.userList = dataDescription.first!.value as! [String]
                
                print(AppData.userList)
                
                print("HERE HERE HERE HERE \(AppData.userList)")
                
                //checking if log in or new user
                if(self.loginCheck == true){
                    
                    //checking if text boxes have an input
                    if(self.userEnter.text == "" || self.passwordEnter.text == ""){
                        self.errorLabel.isHidden = false
                        self.errorLabel.text = "Please enter a username and password"
                    } else{
                        
                        //cheking if userEnter is an existing log in
                        if(AppData.userList.contains(self.userEnter.text!)){
                            self.errorLabel.isHidden = true
                            let tempUser = self.userEnter.text!
                            var password = ""
                            
                            //getting log in from firebase
                            
                            let docRef = AppData.db.collection("User Name Lists").document(tempUser)
                            
                            //getting password from data base
                            docRef.getDocument { (document, error) in
                                if let document = document, document.exists {
                                    let dataDescription = document.data()!
                                    print("Document data: \(dataDescription)")
                                    password = dataDescription.first!.value as! String
                                    
                                    //checking if correct password
                                    if(self.passwordEnter.text == password){
                                        self.errorLabel.isHidden = true
                                        AppData.currentUser = tempUser
                                        print("LOGIN SUCSESSFUL")
                                    }else{
                                        self.errorLabel.isHidden = false
                                        self.errorLabel.text = "Please try again."
                                    }
                                    
                                } else {
                                    print("Document does not exist")
                                }
                            }
                            
                        }else{
                            self.errorLabel.isHidden = false
                            self.errorLabel.text = "Please try again."
                        }
                    }
                } else if(self.loginCheck == false){
                    
                    //checking if text boxes have input
                    if(self.userEnter.text == "" || self.passwordEnter.text == ""){
                        self.errorLabel.isHidden = false
                        self.errorLabel.text = "Please enter a username and password."
                    }else{
                        
                        //checking if username already taken
                        if(AppData.userList.contains(self.userEnter.text!)){
                            self.errorLabel.isHidden = false
                            self.errorLabel.text = "Username already taken."
                        } else{
                            
                            //adding new user to local data
                            AppData.currentUser = self.userEnter.text!
                            AppData.userList.append(self.userEnter.text!)
                            
                            //sending data to firebase
                            AppData.db.collection("User Name Lists").document("User Name Array").setData(["userList" : AppData.userList], merge: false)
                            AppData.db.collection("User Name Lists").document(AppData.currentUser).setData(["password" : self.passwordEnter.text!], merge : true)
                            
                            //creating default user
                            AppData.db.collection("User Name Lists").document(AppData.currentUser).setData(["name" : "no name"], merge: true)
                            AppData.db.collection("User Name Lists").document(AppData.currentUser).setData(["pronouns" : "no name"], merge: true)
                            AppData.db.collection("User Name Lists").document(AppData.currentUser).setData(["age" : "no name"], merge: true)
                            
                        }
                    }
                    
                }
            } else {
                print("Document does not exist")
            }
        }
    }
    
    @IBAction func closePopUp(_ sender: UIButton) {
        self.view.removeFromSuperview()
    }
}

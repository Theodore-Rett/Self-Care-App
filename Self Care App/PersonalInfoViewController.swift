//
//  PersonalInfoViewController.swift
//  Self Care App
//
//  Created by Tiger Coder on 4/8/21.
//

import UIKit

class PersonalInfoViewController: UIViewController {

    @IBOutlet weak var nameDisplay: UILabel!
    @IBOutlet weak var ageDisplay: UILabel!
    @IBOutlet weak var pronounDisplay: UILabel!
    
    @IBOutlet weak var nameEnter: UITextField!
    @IBOutlet weak var ageEnter: UITextField!
    @IBOutlet weak var pronounEnter: UITextField!

    @IBOutlet weak var editInfo: UIButton!
    
    var edit = false
    
    var profile = UserProfile()
    
    let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        //getting User Profile from firebase
        
        
        
        if let data = UserDefaults.standard.data(forKey: "savedProfile") {
            do {
                // Create JSON Decoder
                let decoder = JSONDecoder()
                
                // Decode Note
                profile = try decoder.decode(UserProfile.self, from: data)
                
            } catch {
                print("Unable to Decode Notes (\(error))")
            }
        }
        
        profile = (defaults.object(forKey: "savedProfile") as? UserProfile ?? profile)

        nameDisplay.text = "Name: " + profile.name
        ageDisplay.text = "Age: " + profile.age
        pronounDisplay.text = "Pronouns: " + profile.pronouns
    }
    
    @IBAction func editInfoButton(_ sender: UIButton) {
        
        if(edit){
            profile.changeName(inName: nameEnter.text!)
            profile.changeAge(inAge: ageEnter.text!)
            profile.changePronouns(inPronouns: pronounEnter.text!)
            
            nameEnter.isHidden = true
            ageEnter.isHidden = true
            pronounEnter.isHidden = true
            
            nameDisplay.text = "Name: " + profile.name
            ageDisplay.text = "Age: " + profile.age
            pronounDisplay.text = "Pronouns: " + profile.pronouns
            
            editInfo.setTitle("Edit Info", for: .normal)
            
            do {
                // Create JSON Encoder
                let encoder = JSONEncoder()
     
                // Encode Note
                let data = try encoder.encode(profile)
                
                // Write/Set Data
                UserDefaults.standard.set(data, forKey: "savedProfile")
            } catch {
                print("Unable to Encode Array of Notes (\(error))")
            }
            
            edit = false
            
        } else{
            nameDisplay.text = "Name: "
            ageDisplay.text = "Age: "
            pronounDisplay.text = "Pronouns: "
            
            nameEnter.isHidden = false
            ageEnter.isHidden = false
            pronounEnter.isHidden = false
            
            editInfo.setTitle("Save", for: .normal)
            
            do {
                // Create JSON Encoder
                let encoder = JSONEncoder()
     
                // Encode Note
                let data = try encoder.encode(profile)
                
                // Write/Set Data
                UserDefaults.standard.set(data, forKey: "savedProfile")
            } catch {
                print("Unable to Encode Array of Notes (\(error))")
            }
            
            edit = true
        }
    }
    
    @IBAction func showPopUpButton(_ sender: UIButton) {
        let popOverVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "LogInViewController") as! LogInViewController
        self.addChild(popOverVC)
        popOverVC.view.frame = self.view.frame
        self.view.addSubview(popOverVC.view)
        popOverVC.didMove(toParent: self)
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

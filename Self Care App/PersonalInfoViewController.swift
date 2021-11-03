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
        
        // Do any additional setup after loading the view.
        
    }
    
    @IBAction func editInfoButton(_ sender: UIButton) {
        
        if(edit){
            
            
            profile.changeName(inName: nameEnter.text!)
            profile.changeAge(inAge: ageEnter.text!)
            profile.changePronouns(inPronouns: pronounEnter.text!)
            
            nameDisplay.isHidden = false
            ageDisplay.isHidden = false
            pronounDisplay.isHidden = false
            
            nameEnter.isHidden = true
            ageEnter.isHidden = true
            pronounEnter.isHidden = true
            
            nameDisplay.text = profile.name
            ageDisplay.text = profile.age
            pronounDisplay.text = profile.pronouns
            
            editInfo.setTitle("Edit Info", for: .normal)
            
            edit = false
            
        } else{
            nameDisplay.isHidden = true
            ageDisplay.isHidden = true
            pronounDisplay.isHidden = true
            
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
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

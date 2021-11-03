//
//  UserProfile.swift
//  Self Care App
//
//  Created by TEAGAN RETT on 11/2/21.
//

import Foundation
public class UserProfile: Codable{
    var name = String()
    var age = String()
    var pronouns = String()
    
    init(inName: String, inAge: String, inPronouns: String){
        name = inName
        age = inAge
        pronouns = inPronouns
    }
    
    init(){
        name = "N/A"
        age = "N/A"
        pronouns = "N/A"
    }
    
    func changeName(inName: String){
        name = inName
    }
    
    func changeAge(inAge: String){
        age = inAge
    }
    
    func changePronouns(inPronouns: String){
        pronouns = inPronouns
    }
    
}

//
//  ViewController.swift
//  Self Care App
//
//  Created by Tiger Coder on 4/6/21.
//

import UIKit
import Firebase
import FirebaseFirestore

class AppData{
    static var currentUser = "none"
    static var userList : [String] = []
}

class ViewController: UIViewController{

    let db = Firestore.firestore()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //setting up userList
        
        //create collection refference
        let docRef = db.collection("User Name Lists").document("User Name Array")
        
        //getting total clicks from data base
        docRef.getDocument { (document, error) in
            if let document = document, document.exists {
                let dataDescription = document.data()!
                print("Document data: \(dataDescription)")
                AppData.currentUser = dataDescription.first!.value as! String
            } else {
                print("Document does not exist")
            }
        }
    }
    
    @IBAction func unwind(_ seg: UIStoryboardSegue){

    }
    
}


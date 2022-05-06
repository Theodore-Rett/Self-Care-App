//
//  ScheduleViewController.swift
//  Self Care App
//
//  Created by Tiger Coder on 4/8/21.
//

import UIKit
import Foundation

class ScheduleViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var listDisplay: UITableView!
    @IBOutlet weak var nameEnter: UITextField!
    @IBOutlet weak var timeInput: UIDatePicker!
    
    
    var schedule = [EventMaker]()
    
    let dateFormater = DateFormatter()
    
    let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        listDisplay.delegate = self
        listDisplay.dataSource = self
        
        super.viewDidLoad()
        dateFormater.timeStyle = .short
        
        //Looks for single or multiple taps.
             let tap = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))

            //Uncomment the line below if you want the tap not not interfere and cancel other interactions.
            //tap.cancelsTouchesInView = false

            view.addGestureRecognizer(tap)
        
        if let data = UserDefaults.standard.data(forKey: "savedEvents") {
            do {
                // Create JSON Decoder
                let decoder = JSONDecoder()
                
                // Decode Note
                schedule = try decoder.decode([EventMaker].self, from: data)
                
            } catch {
                print("Unable to Decode Notes (\(error))")
            }
        }
        
        //DATA FROM FIREBASE
        
        //getting name
        
        //getting age
        
        
        
        
    }
    
    @IBAction func addButton(_ sender: UIButton) {
        if(nameEnter.text != nil){
            schedule.append(EventMaker(inName: nameEnter.text!, inTime: timeInput.date))
            schedule = schedule.sorted(by: { $0.time < $1.time })
            listDisplay.reloadData()
        }
    }
    
    @IBAction func saveButton(_ sender: UIButton) {
        //defaults.set(schedule, forKey: "schedule")
        do {
            // Create JSON Encoder
            let encoder = JSONEncoder()
 
            // Encode Note
            let data = try encoder.encode(schedule)
            
            // Write/Set Data
            UserDefaults.standard.set(data, forKey: "savedEvents")
        } catch {
            print("Unable to Encode Array of Notes (\(error))")
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return schedule.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell =  tableView.dequeueReusableCell(withIdentifier: "MyCell")!
        
        cell.textLabel?.text = ((schedule[indexPath.row].name))
        
        cell.detailTextLabel?.text = dateFormater.string(from: (schedule[indexPath.row].time))
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if (editingStyle == .delete){
            schedule.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    @objc func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
    
}

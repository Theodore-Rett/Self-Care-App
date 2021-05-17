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
    
    //var schedule : [String : Date] = [:]
    
    var schedule = [EventMaker]()
    
    let dateFormater = DateFormatter()
    
    let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        listDisplay.delegate = self
        listDisplay.dataSource = self
        
        super.viewDidLoad()
        
        dateFormater.timeStyle = .short
        
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
        
        //        if let list = defaults.object(forKey: "schedule"){
        //            //schedule = list as! [(event : String, time : Date)]
        //
        //        }
        
        // if let list = defults.object(forKey: "save"){
        //     schedule = list as! [EventMaker]
        // }
        // Do any additional setup after loading the view.
    }
    
    @IBAction func addButton(_ sender: UIButton) {
        if(nameEnter.text != nil){
            //schedule.append((event: nameEnter.text!, time: timeInput.date))
            schedule.append(EventMaker(inName: nameEnter.text!, inTime: timeInput.date))
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
    
    //    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    //        let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell")!
    //
    //        //cell.textLabel?.text = (schedule[indexPath.row].String)
    //
    //        cell.textLabel?.text = schedule[indexPath.row].event
    //
    //        cell.detailTextLabel?.text = dateFormater.string(from: schedule[indexPath.row].time)
    //
    //        return cell
    //    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return schedule.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell =  tableView.dequeueReusableCell(withIdentifier: "MyCell")!
        
        cell.textLabel?.text = ((schedule[indexPath.row].name))
        
        cell.detailTextLabel?.text = dateFormater.string(from: (schedule[indexPath.row].time))
        
        return cell
    }
    
//    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
//        if(editingStyle == .delete){
//
//            schedule.remove(at: IndexPath)
//
//            tableView.deleteRows(at: [indexPath], with: .fade)
//        }
//    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}

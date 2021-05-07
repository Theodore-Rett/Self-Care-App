//
//  EventMaker.swift
//  Self Care App
//
//  Created by Tiger Coder on 4/12/21.
//

import Foundation
public class EventMaker: Codable{
    var name = String()
    var time = Date()
    
    init(inName : String, inTime : Date)
    {
        name = inName
        time = inTime
    }
    
    func getName() -> String{
        return name
    }
    
    func getTime() -> Date{
        return time
    }
}

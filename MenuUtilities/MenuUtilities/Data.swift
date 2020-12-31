//
//  Data.swift
//  MenuUtilities
//
//  Created by Mario Elsnig on 30.12.20.
//

import Foundation
import SwiftUI


class Apps {
    static let apps = [time, reminder, notes, clipboard, dayplanner, calculator, todo]
    
    static let time =       App(name: "Time",       iconName: "time")
    static let reminder =   App(name: "Reminder",   iconName: "reminder")
    static let notes =      App(name: "Notes",      iconName: "notes")
    static let clipboard =  App(name: "Clipboard",  iconName: "clipboard")
    static let dayplanner = App(name: "DayPlanner", iconName: "dayplanner")
    static let calculator = App(name: "Calculator", iconName: "calculator")
    static let todo =       App(name: "ToDo",       iconName: "todo")
}


struct App: Codable {
    var name: String
    var iconName: String
}

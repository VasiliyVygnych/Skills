//
//  Model.swift
//  Skills
//
//  Created by Vasiliy Vygnych  on 01.08.2023.
//

import Foundation

struct Skills {
    var skillList: [MySkill]
    }
    
struct MySkill {
    var skill: String
    }
    
enum SaveValue {
    static let mySkills = "mySkills"
    static let saveSection = "saveSection"
    static var isHidden = true
}

//
//  Skills.swift
//  ViewPortfolios
//
//  Created by Arthur MASSON on 10/09/2021.
//

import Foundation

struct ProgrammingLanguageSkill: Hashable, Codable {
    let name: String
}

struct FrameworkSkill: Hashable, Codable {
    let name: String
    let linkedLanguages: [String]
}

struct ToolSkill: Hashable, Codable {
    let name: String
}

let myLanguages: [ProgrammingLanguageSkill] = [
    .init(name: "Swift"),
    .init(name: "C++"),
    .init(name: "C"),
    .init(name: "Rust"),
    .init(name: "Go"),
    
    .init(name: "Javascript"),
    .init(name: "PHP")
]

let myFrameworks: [FrameworkSkill] = [
    .init(name: "Vapor", linkedLanguages: ["Swift", "Html", "CSS", "Javascript"]),
    .init(name: "OpenGL", linkedLanguages: ["C++", "C"]),
    .init(name: "Metal", linkedLanguages: ["Swift", "C++"]),
    
]

let myTools: [ToolSkill] = [
    
]

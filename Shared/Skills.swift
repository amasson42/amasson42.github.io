//
//  Skills.swift
//  ViewPortfolios
//
//  Created by Arthur MASSON on 10/09/2021.
//

import Foundation

enum SkillRate: Int, Codable, ExpressibleByIntegerLiteral {
    case soft = 1
    case able = 2
    case good = 3
    case confident = 4
    case expert = 5

    init(integerLiteral value: IntegerLiteralType) {
        self = .init(rawValue: value)!
    }
}

struct ProgrammingLanguageSkill: Hashable, Codable {
    let rate: SkillRate
    let name: String
}

struct FrameworkSkill: Hashable, Codable {
    let rate: SkillRate
    let name: String
    let linkedLanguages: [String]
}

struct ToolSkill: Hashable, Codable {
    let rate: SkillRate
    let name: String
}

let myLanguages: [ProgrammingLanguageSkill] = [
    
    // Multi-purpose
    .init(rate: 5, name: "Swift"),
    .init(rate: 4, name: "C++"),
    .init(rate: 4, name: "C"),
    .init(rate: 2, name: "Rust"),
    .init(rate: 2, name: "C#"),

    // Backend
    .init(rate: 2, name: "Go"),
    .init(rate: 1, name: "Javascript"),
    .init(rate: 1, name: "Php"),

    // Script
    .init(rate: 3, name: "Python"),
    .init(rate: 3, name: "Bash"),
    .init(rate: 3, name: "Groovy"),
    .init(rate: 1, name: "Powershell"),
    
    // Shader
    .init(rate: 3, name: "glsl"),
    .init(rate: 2, name: "openCL"),
    .init(rate: 2, name: "metal"),
    
]

// TODO: Sort all this


let usefullFrameworks: [FrameworkSkill] = [

    .init(rate: 3, name: "Vapor",
          linkedLanguages: ["Swift", "Html", "Css", "Javascript"]),

    .init(rate: 5, name: "Symfony",
          linkedLanguages: ["Php", "Html", "Css"]
          ),
    .init(rate: 5, name: "AppKit",
          linkedLanguages: ["Objective-C", "Swift"]
          ),
    .init(rate: 5, name: "SwiftUI",
          linkedLanguages: ["Swift"]
          ),
    .init(rate: 5, name: "Gin",
          linkedLanguages: ["Go"]
          ),
]

let graphicFrameworks: [FrameworkSkill] = [
    .init(rate: 5, name: "OpenGL",
          linkedLanguages: ["C++", "C"]
          ),
    .init(rate: 5, name: "Metal",
          linkedLanguages: ["Swift", "C++"]
          ),
    .init(rate: 5, name: "Unity",
          linkedLanguages: ["C#"]
          ),
    .init(rate: 5, name: "UE5",
          linkedLanguages: ["C++"]
          ),
    .init(rate: 5, name: "SceneKit",
          linkedLanguages: ["Swift"]
          ),
    .init(rate: 5, name: "SpriteKit",
          linkedLanguages: ["Swift"]
          ),
]

let lowTierFrameworks: [FrameworkSkill] = [
    .init(rate: 3, name: "Sword",
          linkedLanguages: ["Swift"]),
]

let myTools: [ToolSkill] = [
    .init(rate: 3, name: "Jenkins")
]

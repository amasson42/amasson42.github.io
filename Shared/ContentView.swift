//
//  ContentView.swift
//  Shared
//
//  Created by Giantwow on 09/09/2021.
//

import SwiftUI
import Foundation

struct ContentView: View {
    var body: some View {
        VStack {
            HeaderView()
            
            // 1 - About me
            
            // Hideable view to display my biography
            BiographyView()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color.purple.grayscale(0.8))
            
            SkillView()
            
            // 2 - Projects
            
            // All projects
            ProjectListView()
            
            FooterView()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color.gray)
        }
    }
}

struct HeaderView: View {
    var body: some View {
        HStack {
            Image(asset: "portfolio/circus.png")
                .resizable()
                .scaledToFit()
                .frame(width: 200, height: 200)
            VStack {
                Text("Arthur Masson")
                Text("Developer full-stack")
                Text("Must. Automate. Everything.")
                    .fontWeight(.medium)
                    .font(.caption)
            }
        }
    }
}

struct BiographyView: View {
    var body: some View {
        VStack {
            Text("Me talking about me")
            Text("""
Hello
There
""")
        }
    }
}

struct SkillView: View {
    
    var body: some View {
        VStack {
            Text(String(asset: "selfbio/me-talking-about-me.txt"))
                .multilineTextAlignment(.leading)
                .lineLimit(5)
            
//            ForEach(skills, id: \.self) { skill in
//                Text(skill.language)
//                    .font(.title)
//                HStack {
//                    List {
//                        ForEach(skill.frameworks, id: \.self) { framework in
//                            Text(framework)
//                                .font(.title2)
//                        }
//                    }
//                }
//            }
        }
    }
}

struct ProjectListView: View {
    var body: some View {
        HStack {
            VStack {
                Text("Project 1")
                Text("Project 2")
            }
            .frame(width: 200)
            
            VStack {
                Text("""
                    <h2>Project 1</h2>
                    what is was about (kind of long)
                    """)
                Text("""
                    <h2>Project 2</h2>
                    what is was about (king of long)
                    """)
            }
        }
    }
}

struct FooterView: View {
    var body: some View {
        HStack {
            Text("Footer")
        }
    }
}

extension Image {
    init(asset path: String) {
        let resourcesPath = Bundle.main.path(forResource: "assets/img/\(path)", ofType: nil)!
        #if canImport(AppKit)
        let image = NSImage(contentsOfFile: resourcesPath)!
        self.init(nsImage: image)
        #elseif canImport(UIKit)
        let image = UIImage(contentsOfFile: resourcesPath)!
        self.init(uiImage: image)
        #endif
    }
}

extension String {
    init(asset path: String) {
        let resourcesPath = Bundle.main.path(forResource: "assets/txt/\(path)", ofType: nil)!
        try! self.init(contentsOfFile: resourcesPath)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

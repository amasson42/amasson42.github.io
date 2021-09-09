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
            
            // Hideable view to display my biography
            BiographyView()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color.purple.grayscale(0.8))
            
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
            Image(asset: "img/portfolio/circus.png")
                .resizable()
                .scaledToFit()
                .frame(width: 200, height: 200)
            VStack {
                Text("Arthur Masson")
                Text("Developer of things")
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
        let resourcesPath = Bundle.main.path(forResource: "assets/\(path)", ofType: nil)!
        #if canImport(AppKit)
        let image = NSImage(contentsOfFile: resourcesPath)!
        self.init(nsImage: image)
        #elseif canImport(UIKit)
        let image = UIImage(contentsOfFile: resourcesPath)!
        self.init(uiImage: image)
        #endif
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

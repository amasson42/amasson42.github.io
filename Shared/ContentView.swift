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
        HStack {
            Text("Hello, world!")
                .padding()
            Image("assets/img/portfolio/submarine.png", bundle: .main)
        }
        .onAppear {
            
            print(FileManager.default.currentDirectoryPath)
            try? print(FileManager.default.contentsOfDirectory(atPath: "."))
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

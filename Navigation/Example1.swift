//
//  ContentView1.swift
//  Navigation
//
//  Created by Martin Lienhard on 11/14/23.
//

import Foundation
import SwiftUI

struct DetailView: View {
    var number: Int
    
    var body: some View {
        Text("Detail view \(number)")
    }
    
    init(number: Int) {
        self.number = number
        print("Creating detail view \(number)")
    }
}

struct Example1: View {
    var body: some View {
        /*
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
        */
        NavigationStack {
            List(0..<100) { i in
                NavigationLink("Tap me") {
                    DetailView(number: i)
                }
            }
        }
    }
}

#Preview {
    Example1()
}

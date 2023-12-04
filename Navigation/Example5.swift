//
//  Example5.swift
//  Navigation
//
//  Created by Martin Lienhard on 11/16/23.
//

import Foundation
import SwiftUI

struct DetailView2: View {
    var number: Int
    @Binding var path: NavigationPath

    var body: some View {
        NavigationLink("Go to Random Number", value: Int.random(in: 1...1000))
            .navigationTitle("Number: \(number)")
            .toolbar {
                Button("Home") {
                    path = NavigationPath()
                }
            }
    }
}

struct Example5: View {
    @State private var path = NavigationPath()

    var body: some View {
        NavigationStack(path: $path) {
            DetailView2(number: 0, path: $path)
                .navigationDestination(for: Int.self) { i in
                    DetailView2(number: i, path: $path)
                }
        }
    }
}

#Preview {
    Example5()
}

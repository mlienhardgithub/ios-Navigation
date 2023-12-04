//
//  Example4.swift
//  Navigation
//
//  Created by Martin Lienhard on 11/14/23.
//

import Foundation
import SwiftUI

struct Example4: View {
    @State private var path = NavigationPath()
    
    var body: some View {
        NavigationStack(path: $path) {
            List {
                ForEach(0..<5) { i in
                    NavigationLink("Select number \(i)", value: i)
                }
                ForEach(0..<5) { i in
                    NavigationLink("Select string \(i)", value: String(i))
                }
            }
            .toolbar {
                Button("Show 556") {
                    path.append(556)
                }
                Button("Show Hello") {
                    path.append("Hello")
                }
            }
            .navigationDestination(for: Int.self) { selection in
                Text("You selected the number \(selection)")
            }
            .navigationDestination(for: String.self) { selection in
                Text("You selected the string \(selection)")
            }
        }
    }
}

#Preview {
    Example4()
}

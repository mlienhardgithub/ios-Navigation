//
//  ContentView2.swift
//  Navigation
//
//  Created by Martin Lienhard on 11/3/23.
//

import Foundation
import SwiftUI

struct Student: Hashable {
    var id = UUID()
    var name: String
    var age: Int
}

struct Example2: View {
    var body: some View {
        NavigationStack {
            List(0..<10) { i in
                NavigationLink("Select \(i)", value: i)
            }
            .navigationDestination(for: Int.self) { selection in
                Text("You selected \(selection)")
            }
            .navigationDestination(for: Student.self) { student in
                Text("You selected \(student.name)")
            }
        }
    }
}

#Preview {
    Example2()
}

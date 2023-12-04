//
//  Example3.swift
//  Navigation
//
//  Created by Martin Lienhard on 11/14/23.
//

import Foundation
import SwiftUI

struct Example3: View {
    @State private var path = [Int]()
    
    var body: some View {
        NavigationStack(path: $path) {
            VStack {
                Button("Show 32") {
                    path = [32]
                }
                Button("Show 64") {
                    path.append(64)
                }
                Button("Show 32") {
                    path = [32, 64]
                }
            }
            .navigationDestination(for: Int.self) { selection in
                Text("You selected \(selection)")
            }
        }
    }
}

#Preview {
    Example3()
}

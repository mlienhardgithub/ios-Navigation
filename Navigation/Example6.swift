//
//  Example6.swift
//  Navigation
//
//  Created by Martin Lienhard on 11/21/23.
//

import Foundation
import SwiftUI

@Observable
class PathStore {
    var path: NavigationPath {
        didSet {
            save()
        }
    }

    private let savePath = URL.documentsDirectory.appending(path: "SavedPath")

    init() {
        if let data = try? Data(contentsOf: savePath) {
            if let decoded = try? JSONDecoder().decode(NavigationPath.CodableRepresentation.self, from: data) {
                    path = NavigationPath(decoded)
                    return
            }
        }

        // Still here? Start with an empty path.
        path = NavigationPath()
    }

    func save() {
        guard let representation = path.codable else { return }
        do {
            let data = try JSONEncoder().encode(representation)
            try data.write(to: savePath)
        } catch {
            print("Failed to save navigation data")
        }
    }
}

struct DetailView3: View {
    var number: Int

    var body: some View {
        NavigationLink("Go to Random Number", value: Int.random(in: 1...1000))
            .navigationTitle("Number: \(number)")
    }
}

struct Example6: View {
    @State private var pathStore = PathStore()

    var body: some View {
        NavigationStack(path: $pathStore.path) {
            DetailView3(number: 0)
                .navigationDestination(for: Int.self) { i in
                    DetailView3(number: i)
                }
        }
    }
}

#Preview {
    Example6()
}

//
//  Task.swift
//  ToDoSwiftUI-MVVM
//
//  Created by Krystian Grabowy on 23/01/2024.
//

import Foundation

struct Task: Identifiable, Codable {
    var id = UUID()
    var title: String
}

//
//  TaskListViewModel.swift
//  ToDoSwiftUI-MVVM
//
//  Created by Krystian Grabowy on 23/01/2024.
//

import Foundation
import Combine

class TaskListViewModel: ObservableObject {
    @Published var tasks: [Task] = []

    func addTask(title: String) {
        tasks.append(Task(title: title))
    }

    func deleteTask(at indexSet: IndexSet) {
        tasks.remove(atOffsets: indexSet)
    }
}

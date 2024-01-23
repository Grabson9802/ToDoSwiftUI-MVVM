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

    init() {
        loadTasks()
    }

    func addTask(title: String) {
        tasks.append(Task(title: title))
        saveTasks()
    }

    func deleteTask(at indexSet: IndexSet) {
        tasks.remove(atOffsets: indexSet)
        saveTasks()
    }

    private func saveTasks() {
        do {
            let encodedData = try JSONEncoder().encode(tasks)
            UserDefaults.standard.set(encodedData, forKey: "tasks")
        } catch {
            print("Error encoding tasks: \(error.localizedDescription)")
        }
    }

    private func loadTasks() {
        if let encodedData = UserDefaults.standard.data(forKey: "tasks") {
            do {
                tasks = try JSONDecoder().decode([Task].self, from: encodedData)
            } catch {
                print("Error decoding tasks: \(error.localizedDescription)")
            }
        }
    }
}


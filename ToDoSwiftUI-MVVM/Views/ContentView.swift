//
//  ContentView.swift
//  ToDoSwiftUI-MVVM
//
//  Created by Krystian Grabowy on 23/01/2024.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel = TaskListViewModel()
    @State private var newTaskTitle = ""

    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.tasks) { task in
                    Text(task.title)
                }
                .onDelete(perform: viewModel.deleteTask)
            }
            .navigationTitle("To-Do List")
            .navigationBarItems(trailing: EditButton())
            .navigationBarItems(leading: HStack {
                TextField("New Task", text: $newTaskTitle)
                Button(action: addTask) {
                    Image(systemName: "plus")
                }
            })
        }
    }

    func addTask() {
        if !newTaskTitle.isEmpty {
            viewModel.addTask(title: newTaskTitle)
            newTaskTitle = ""
        }
    }
}

#Preview {
    ContentView()
}

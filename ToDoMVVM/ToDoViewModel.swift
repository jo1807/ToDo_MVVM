//
//  ToDoViewModel.swift
//  ToDoMVVM
//
//  Created by Joanne on 18/01/2025.
//

import Foundation

class TodoViewModel: ObservableObject {
    @Published var todos: [TodoItem] = []
    
    func addTodo(title: String) {
        guard !title.isEmpty else { return }
        let newTodo = TodoItem(title: title)
        todos.append(newTodo)
    }
    
    func toggleCompletion(for todo: TodoItem) {
        if let index = todos.firstIndex(of: todo) {
            todos[index].isCompleted.toggle()
        }
    }
    
    func deleteTodo(at offsets: IndexSet) {
        todos.remove(atOffsets: offsets)
    }
}

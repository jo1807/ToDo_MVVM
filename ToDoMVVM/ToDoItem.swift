//
//  ToDoItem.swift
//  ToDoMVVM
//
//  Created by Joanne on 18/01/2025.
//

import Foundation

struct TodoItem: Identifiable, Equatable {
    let id: UUID
    var title: String
    var isCompleted: Bool
    
    init(id: UUID = UUID(), title: String, isCompleted: Bool = false) {
        self.id = id
        self.title = title
        self.isCompleted = isCompleted
    }
}


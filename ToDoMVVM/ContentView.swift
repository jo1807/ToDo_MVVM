//
//  ContentView.swift
//  ToDoMVVM
//
//  Created by Joanne on 18/01/2025.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = TodoViewModel()
    @State private var newTodoTitle: String = ""
    
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    TextField("Enter new to-do", text: $newTodoTitle)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding(.horizontal)
                    
                    Button(action: {
                        viewModel.addTodo(title: newTodoTitle)
                        newTodoTitle = ""
                    }) {
                        Image(systemName: "plus.circle.fill")
                            .font(.title)
                    }
                    .disabled(newTodoTitle.isEmpty)
                }
                .padding()
                
                List {
                
                    ForEach(viewModel.todos) { todo in
                    
                        HStack {
                            Text(todo.title)
                                .strikethrough(todo.isCompleted)
                            Spacer()
                            Button(action: {
                                viewModel.toggleCompletion(for: todo)
                            }) {
                                Image(systemName: todo.isCompleted ? "checkmark.circle.fill" : "circle")
                            }
                        }
                    }
                    .onDelete(perform: viewModel.deleteTodo)
                }
            }
            .navigationTitle("To-Do List")
        }
    }
}

#Preview {
    ContentView()
}

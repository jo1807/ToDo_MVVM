//
//  ToDoViewModelTests.swift
//  ToDoMVVM
//
//  Created by Joanne on 18/01/2025.
//

import XCTest
@testable import ToDoMVVM

class TodoViewModelTests: XCTestCase {
    var viewModel: TodoViewModel!

    override func setUp() {
        super.setUp()
        viewModel = TodoViewModel()
    }

    override func tearDown() {
        viewModel = nil
        super.tearDown()
    }

    func testAddingTodo() {
        viewModel.addTodo(title: "Test Todo")
        XCTAssertEqual(viewModel.todos.count, 1)
        XCTAssertEqual(viewModel.todos.first?.title, "Test Todo")
    }

    func testEmptyTodoNotAdded() {
        viewModel.addTodo(title: "")
        XCTAssertTrue(viewModel.todos.isEmpty)
    }

    func testToggleCompletion() {
        let todo = TodoItem(title: "Test Todo")
        viewModel.todos.append(todo)
        viewModel.toggleCompletion(for: todo)
        XCTAssertTrue(viewModel.todos.first?.isCompleted ?? false)
    }

    func testDeleteTodo() {
        let todo = TodoItem(title: "Test Todo")
        viewModel.todos.append(todo)
        viewModel.deleteTodo(at: IndexSet(integer: 0))
        XCTAssertTrue(viewModel.todos.isEmpty)
    }
}

//
//  ToDoMVVMUITests.swift
//  ToDoMVVMUITests
//
//  Created by Joanne on 18/01/2025.
//

import XCTest

final class TodoAppUITests: XCTestCase {
    var app: XCUIApplication!

    override func setUpWithError() throws {
        // Set up the app instance
        app = XCUIApplication()
        app.launch()

        // Stop tests on failure
        continueAfterFailure = false
    }

    override func tearDownWithError() throws {
        app = nil
    }

    func testAddTodo() {
        // Input a new to-do
        let newTodoField = app.textFields["Enter new to-do"]
        XCTAssertTrue(newTodoField.exists, "The input field should exist")
        
        newTodoField.tap()
        newTodoField.typeText("Buy groceries")
        
        let addButton = app.buttons["plus.circle.fill"]
        XCTAssertTrue(addButton.exists, "The add button should exist")
        
        addButton.tap()
        
        // Verify the to-do is added to the list
        let todoCell = app.staticTexts["Buy groceries"]
        XCTAssertTrue(todoCell.exists, "The new to-do should appear in the list")
    }

    func testToggleTodoCompletion() {
        // Add a to-do item
        let newTodoField = app.textFields["Enter new to-do"]
        newTodoField.tap()
        newTodoField.typeText("Complete SwiftUI project")
        app.buttons["plus.circle.fill"].tap()
        
        // Toggle completion status
        let toggleButton = app.buttons["circle"]
        XCTAssertTrue(toggleButton.exists, "The toggle button should exist")
        
        toggleButton.tap()
        
        // Verify the completion toggle
        let completedToggleButton = app.buttons["checkmark.circle.fill"]
        XCTAssertTrue(completedToggleButton.exists, "The toggle button should show as completed")
    }

    func testDeleteTodo() {
        // Add a to-do item
        let newTodoField = app.textFields["Enter new to-do"]
        newTodoField.tap()
        newTodoField.typeText("Write tests")
        app.buttons["plus.circle.fill"].tap()
        
        // Swipe to delete
        let todoCell = app.staticTexts["Write tests"]
        XCTAssertTrue(todoCell.exists, "The to-do should exist before deletion")
        
        todoCell.swipeLeft()
        app.buttons["Delete"].tap()
        
        // Verify the to-do is deleted
        XCTAssertFalse(todoCell.exists, "The to-do should be removed from the list")
    }
}

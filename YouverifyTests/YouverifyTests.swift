//
//  YouverifyTests.swift
//  YouverifyTests
//
//  Created by Daniel Jermaine on 13/03/2025.
//

import XCTest
import CoreData
@testable import Youverify

final class DessertCoredataViewmodelTests: XCTestCase {

    var viewModel: DessertCoredataViewmodel!

    override func setUpWithError() throws {
        // Initialize the view model.
        viewModel = DessertCoredataViewmodel()
        
        // Clean up any pre-existing data.
        let context = viewModel.container.viewContext
        for entity in viewModel.savedEntity {
            context.delete(entity)
        }
        try? context.save()
        viewModel.fetchbooking()
    }

    override func tearDownWithError() throws {
        viewModel = nil
    }
    
    func testAddBooking() throws {
        // Given: the current count of saved entities.
        let initialCount = viewModel.savedEntity.count
        
        // When: we add a new booking.
        viewModel.addBooking(Name: "Test Dessert")
        viewModel.fetchbooking()
        
        // Then: the count should increase by one.
        XCTAssertEqual(viewModel.savedEntity.count, initialCount + 1, "Adding a booking should increase the count by 1")
        
        // And: the newly added entity should have the expected name.
        let lastEntity = viewModel.savedEntity.last
        XCTAssertEqual(lastEntity?.name, "Test Dessert", "The last entity's name should be 'Test Dessert'")
    }
    
    func testDeleteBooking() throws {
        // First, add a booking so that there's something to delete.
        viewModel.addBooking(Name: "Test Dessert")
        viewModel.fetchbooking()
        let countAfterAdding = viewModel.savedEntity.count
        XCTAssertGreaterThan(countAfterAdding, 0, "There should be at least one booking after adding")
        
        // When: we delete the last added entity.
        viewModel.delete(index: IndexSet(integer: countAfterAdding - 1))
        viewModel.fetchbooking()
        
        // Then: the count should be decreased by one.
        XCTAssertEqual(viewModel.savedEntity.count, countAfterAdding - 1, "Deleting a booking should reduce the count by 1")
    }
    
    func testFetchBooking() throws {
        // Clean all data.
        let context = viewModel.container.viewContext
        for entity in viewModel.savedEntity {
            context.delete(entity)
        }
        try context.save()
        viewModel.fetchbooking()
        XCTAssertEqual(viewModel.savedEntity.count, 0, "After deleting all entities, the count should be 0")
        
        // When: adding a new booking.
        viewModel.addBooking(Name: "Another Dessert")
        viewModel.fetchbooking()
        
        // Then: the savedEntity count should be 1.
        XCTAssertEqual(viewModel.savedEntity.count, 1, "After adding one entity, the count should be 1")
    }
}

//
//  MyCreditManagerTests.swift
//  MyCreditManagerTests
//
//  Created by Soo on 2022/11/17.
//

import XCTest
import MyCreditManager

final class MyCreditManagerTests: XCTestCase {
    
    let myCreditManager = MyCreditManager()

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testAddStudent() {
        let isSuccess = myCreditManager.addStudent(name: "ABC") == .success(Student(name: "ABC")) ? true : false
        XCTAssertTrue(isSuccess)
    }
    
    func testDeleteStudet() {
        let isSuccess = myCreditManager.deleteStudent(name: "ABC") != .success(Student(name: "ABC")) ? true : false
        XCTAssertTrue(isSuccess)
    }
    
    func testAddGrade() {
        let isSuccess = myCreditManager.addGrades(name: "ABC", subject: "DE", grade: "A") == .success(Student(name: "ABC", subject: "DE", grade: "A")) ? true : false
        XCTAssertTrue(isSuccess)
    }
    
    func testDeleteGrade() {
        let isSuccess = myCreditManager.deleteGrades(name: "ABC", subject: "DE") != .success(Student(name: "ABC")) ? true : false
        XCTAssertTrue(isSuccess)

    }

    func testShowAverage() {
        let isSuccess = myCreditManager.addStudent(name: "ABC") == .success(Student(name: "ABC")) ? true : false
        XCTAssertTrue(isSuccess)
    }
}

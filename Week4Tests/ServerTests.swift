//
//  ServerTests.swift
//  Week4Tests
//
//  Created by Charlie Botello on 4/19/21.
//

import XCTest
@testable import Week4

class ServerTests: XCTestCase {
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testServerModel_WhenValidCredetialsProvided_ShouldReturnTrue() {
        //arrange
        var sut: Server!
        sut = Server()
        //act
        let createUser = sut.createNewUser(userName: "user", password: "Pass1234")
        //assert
        XCTAssertTrue(createUser.0, "The createNewUser() should have return TRUE for valid username and password, but returned FALSE")
    }
    
    func testServerModel_WhenLoginWithCorrectCredential_ShouldReturnTrue() {
        //arrange
        var sut: Server!
        sut = Server()
        sut.createNewUser(userName: "user", password: "Pass1234")
        //act
        let checkUser = sut.login(userName: "user", password: "Pass1234")
        //assert
        XCTAssertTrue(checkUser.0, "The login() should have return TRUE for valid username and password, but returned FALSE")
    }

    func testServerModel_WhenLogoutUserFoundAndSessionIsEnded_ShouldReturnTrue() {
        //arrange
        var sut: Server!
        sut = Server()
        sut.createNewUser(userName: "user", password: "Pass1234")
        sut.login(userName: "user", password: "Pass1234")
        //act
        let isUserLogOut = sut.logout()
        //assert
        XCTAssertTrue(isUserLogOut.0, "The logout() function should have return TRUE, but return FALSE")
    }
    
    func testServerModel_WhenValidUserUpdatesPassword_ShouldReturnTrue() {
        //arrange
        var sut: Server!
        sut = Server()
        sut.createNewUser(userName: "user", password: "Pass1234")
        sut.login(userName: "user", password: "Pass1234")
        let currentPassword = sut.registeredUsers[sut.loggedInUser!]
        
        //act
        let isUserPasswordUpdated = sut.updatePassword(current: currentPassword!, update: "Pass1234")
        
        //assert
        XCTAssertTrue(isUserPasswordUpdated.0, "the updatePassword() should have return TRUE, but return FALSE")
    }
}

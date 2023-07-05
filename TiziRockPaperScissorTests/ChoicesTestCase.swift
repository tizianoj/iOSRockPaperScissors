//
//  ChoicesTestCase.swift
//  TiziRockPaperScissorTests
//
//  Created by tizianoj on 21/06/23.
//

import XCTest

@testable import TiziRockPaperScissor
final class ChoicesTestCase: XCTestCase {

    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testWins() throws {
        XCTAssertTrue(Choices.scissors > Choices.paper)
        XCTAssertTrue(Choices.scissors < Choices.rock)
        XCTAssertTrue(Choices.rock > Choices.scissors)
        XCTAssertTrue(Choices.rock < Choices.paper)
        XCTAssertTrue(Choices.paper > Choices.rock)
        XCTAssertTrue(Choices.paper < Choices.scissors)
    }
    
    func testLoses() throws {
        XCTAssertFalse(Choices.paper > Choices.scissors)
        XCTAssertFalse(Choices.scissors > Choices.rock)
        XCTAssertFalse(Choices.rock > Choices.paper)
        
    }
        
    func testEquals() throws {
        XCTAssertFalse(Choices.paper == Choices.scissors)
        XCTAssertTrue(Choices.rock == Choices.rock)
    }
    

}

//
//  BullsEyeTests.swift
//  BullsEyeTests
//
//  Created by 杨宗维 on 2018/5/29.
//  Copyright © 2018年 Ray Wenderlich. All rights reserved.
//

import XCTest
@testable import BullsEye
var gameUnderTest:BullsEyeGame!


class BullsEyeTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        gameUnderTest = BullsEyeGame()
        gameUnderTest.startNewGame()
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        gameUnderTest = nil
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testScoreIsComputedWhenGuessGTTarget(){
        
        let guess = gameUnderTest.targetValue + 5
        
        _ = gameUnderTest.check(guess: guess)
        
        XCTAssertEqual(gameUnderTest.scoreRound, 95, "Score computed from guess us wrong")
    }
    func testScoreIsComputedWhenGuessLTTarget(){
        
        let guess = gameUnderTest.targetValue - 5
        
        _ = gameUnderTest.check(guess: guess)
        
        XCTAssertEqual(gameUnderTest.scoreRound, 95, "Score computed from guess us wrong")
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}

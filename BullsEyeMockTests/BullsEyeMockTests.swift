//
//  BullsEyeMockTests.swift
//  BullsEyeMockTests
//
//  Created by 杨宗维 on 2018/5/30.
//  Copyright © 2018年 Ray Wenderlich. All rights reserved.
//

import XCTest
@testable import BullsEye

class MockUserDefaults: UserDefaults {
    var gameStyleChanged = 0
    override func set(_ value:Int , forKey defaultName:String){
        if defaultName == "gameStyle"{
            gameStyleChanged += 1
        }
    }
    
}

class BullsEyeMockTests: XCTestCase {
    var controllerUnderTest:ViewController!
    var mockUserDefaults:MockUserDefaults!
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        controllerUnderTest = UIStoryboard(name: "Main", bundle: nil).instantiateInitialViewController() as! ViewController!
        mockUserDefaults = MockUserDefaults(suiteName: "testing")!
        controllerUnderTest.defaults = mockUserDefaults
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        controllerUnderTest = nil
        mockUserDefaults = nil
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    func testGameStyleCanBeChanged(){
        let segmentedControl = UISegmentedControl()
        XCTAssertEqual(mockUserDefaults.gameStyleChanged, 0, "gameStyle应该是0 在开始动作前")
        segmentedControl.addTarget(controllerUnderTest, action: #selector(ViewController.chooseGameStyle(_:)), for: .valueChanged)
        segmentedControl.sendActions(for: .valueChanged)
        
        XCTAssertEqual(mockUserDefaults.gameStyleChanged, 1, "gameStyle user default 没有改变")
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}

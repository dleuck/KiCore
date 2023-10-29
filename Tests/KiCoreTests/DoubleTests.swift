//
//  DoubleTests.swift
//  
//
//  Created by Daniel Leuck on 2023/03/12.
//

import XCTest
@testable import KiCore

final class DoubleTests: XCTestCase {

    func testClamp() {
        let num = 2.0
        »num.clamp(1.0...10.0)
        XCTAssertEqual(num.clamp(1.0...10.0), 2.0)
    }
    
    func testClampUnder() {
        let num = 0.5
        »num.clamp(3.0...9.0)
        XCTAssertEqual(num.clamp(3.0...9.0), 3.0)
    }
    
    func testClampOver() {
        let num = 9.5
        »num.clamp(3.0...9.0)
        XCTAssertEqual(num.clamp(3.0...9.0), 9.0)
    }
    
    func testBetween() throws {
        XCTAssertEqual(between(5, 10), 7.5)
        XCTAssertEqual(between(10, 5), 7.5)
        
        XCTAssertEqual(between(10, 20, percent:0.75), 17.5)
        XCTAssertEqual(between(20, 10, percent:0.75), 12.5)
    }
    
    func testRounding() throws {
        XCTAssertEqual(preciseRound(1.27), 1) // Result is 1
        XCTAssertEqual(preciseRound(1.27, precision: .tenths), 1.3)
        XCTAssertEqual(preciseRound(1.272, precision: .hundredths), 1.27)
        XCTAssertEqual(preciseRound(1.2728, precision: .thousandths), 1.273)
    }
}

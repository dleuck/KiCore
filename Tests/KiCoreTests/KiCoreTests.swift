import XCTest
@testable import KiCore

final class KiCoreTests: XCTestCase {
    
    func testTrim() throws {
        XCTAssertEqual("Hello ".trim(), "Hello")
        XCTAssertEqual(" Hello".trim(), "Hello")
        XCTAssertEqual(" Hello ".trim(), "Hello")
        XCTAssertEqual("Hello   ".trim(), "Hello")
        XCTAssertEqual("""
            
            Hello
            
            """.trim(), "Hello")
    }
    
    func testTrimLeft() throws {
        XCTAssertEqual(" Hello ".trimLeft(), "Hello ")
        XCTAssertEqual(" Hello".trimLeft(), "Hello")
        XCTAssertEqual(" \n\n\tHello  ".trimLeft(), "Hello  ")
        XCTAssertEqual(" \n\n\t   ".trimLeft(), "")
    }
    
    func testGrids() throws {
        »Grid<String>(width: 4, height: 3, fill: "A").description
        XCTAssertEqual(Grid<String>(width: 4, height: 3, fill: "A").description,
                        """
                        [["A", "A", "A", "A"], ["A", "A", "A", "A"], ["A", "A", "A", "A"]]
                        """)
    }
    
    func testLogOp() throws {
        XCTAssertEqual(»5, "5 (Int)")
        XCTAssertEqual(»"hello", "\"hello\" (String)")
        XCTAssertEqual(»[1, 2], "[1, 2] (Array<Int>)")
        XCTAssertEqual(»nil, "nil")
    }
    
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
    
    /* Requires manual input
    func testIO() throws {
        let name = ask("Name?")
        »name
        
        let amount = try IO.readIntInput()
        »amount
        
        let howMany = try askInt("How Many?")
        »howMany
    }
    */
}

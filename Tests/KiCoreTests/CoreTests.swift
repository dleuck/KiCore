import XCTest
@testable import KiCore

final class CoreTests: XCTestCase {
   
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

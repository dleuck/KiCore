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
    
    ////
    
    func testStringBeforeSubstring() throws {
        let text = "hello:there"
        
        var substring = ":"
        var answer = text.before(substring)
        
        XCTAssertEqual(answer, "hello")
        
        ////
        
        substring = "@"
        answer = text.before(substring)
        
        XCTAssertEqual(answer, nil)
    }
    
    func testStringBeforeChar() throws {
        let text = "hello:there"
        
        var char = Char(":")
        var answer = text.before(char)
        
        XCTAssertEqual(answer, "hello")
        
        ////
        
        char = Char("@")
        answer = text.before(char)
        
        XCTAssertEqual(answer, nil)
    }
    
    func testStringAfterSubstring() throws {
        let text = "hello:there"
        
        var substring = ":"
        var answer = text.after(substring)
        
        XCTAssertEqual(answer, "there")
        
        ////
        
        substring = "@"
        answer = text.after(substring)
        
        XCTAssertEqual(answer, nil)
    }
    
    func testStringAfterChar() throws {
        let text = "hello:there"
        
        var char = Char(":")
        var answer = text.after(char)
        
        XCTAssertEqual(answer, "there")
        
        ////
        
        char = "@"
        answer = text.after(char)
        
        XCTAssertEqual(answer, nil)
    }
    
    ////
    
    func testStringBeforeLastSubstring() throws {
        let text = "hello:there:Keiko"
        
        var substring = ":"
        var answer = text.beforeLast(substring)
        
        XCTAssertEqual(answer, "hello:there")
        
        ////
        
        substring = "@"
        answer = text.before(substring)
        
        XCTAssertEqual(answer, nil)
    }
    
    func testStringBeforeLastChar() throws {
        let text = "hello:there:Keiko"
        
        var char = Char(":")
        var answer = text.beforeLast(char)
        
        XCTAssertEqual(answer, "hello:there")
        
        ////
        
        char = "@"
        answer = text.beforeLast(char)
        
        XCTAssertEqual(answer, nil)
    }
    
    ////
    
    func testStringAfterLastSubstring() throws {
        let text = "hello:there:Keiko"
        
        var substring = ":"
        var answer = text.afterLast(substring)
        
        XCTAssertEqual(answer, "Keiko")
        
        ////
        
        substring = "@"
        answer = text.afterLast(substring)
        
        XCTAssertEqual(answer, nil)
    }
    
    func testStringAfterLastChar() throws {
        let text = "hello:there:Keiko"
        
        var char = Char(":")
        var answer = text.afterLast(char)
        
        XCTAssertEqual(answer, "Keiko")
        
        ////
        
        char = Char("@")
        answer = text.afterLast(char)
        
        XCTAssertEqual(answer, nil)
    }
    
    ////
    
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

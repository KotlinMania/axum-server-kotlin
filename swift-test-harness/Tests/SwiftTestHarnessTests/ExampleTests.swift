#if canImport(Testing)
import Testing
import AxumServer

@Suite("AxumServer Swift Export Tests")
struct AxumServerExportTests {
    @Test("AxumServer swift module imported cleanly")
    func testSwiftModuleLoads() throws {
        #expect(Bool(true), "AxumServer swift module imported cleanly")
    }
}
#elseif canImport(XCTest)
import XCTest
import AxumServer

final class AxumServerExportTests: XCTestCase {
    func testSwiftModuleLoads() throws {
        XCTAssertTrue(true, "AxumServer swift module imported cleanly")
    }
}
#endif

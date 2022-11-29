//
//  PathMatchingTests.swift
//  PathMatching
//
//  Created by Sven Herzberg on 29.11.22.
//

import XCTest

import PathMatching

final class PathMatchingTests: XCTestCase {
    func testMatchSuccess () throws {
        // Arrange:
        let sut = Path(components: ["hello-world"])
        let patterns: [Path.Pattern] = [
            .constant("hello-world"),
            .prefix("hello-world", []),
        ]
        
        for pattern in patterns {
            // Act:
            let match = pattern ~= sut
            
            // Assert:
            XCTAssert(match, "\(pattern)")
        }
    }
    
    func testMatchFailure () throws {
        // Arrange:
        let sut = Path(components: ["hello-world"])
        let patterns: [Path.Pattern] = [
            .constant("foobar"),
            .prefix("foobar", []),
            .prefix("hello-world", ["foobar"]),
        ]
        
        for pattern in patterns {
            // Act:
            let match = pattern ~= sut
            
            // Assert:
            XCTAssertFalse(match, "\(pattern)")
        }
    }
    
    func testBindSuffix () throws {
        // Arrange:
        let sut = Path(components: ["hello", "world"])

        // Act:
        #if false
        XCTExpectFailure { XCTFail("Test is not really enabled.") }
        #else
        switch sut {
        case let .prefix("hello", world): // ERROR: Pattern variable binding cannot appear in an expression
            XCTAssertEqual(world, ["world"])
        default:
            XCTFail("Did not match and bind.")
        }
        #endif
    }
}

import XCTest

#if !canImport(ObjectiveC)
public func allTests() -> [XCTestCaseEntry] {
    return [
        testCase(SharkStackKitTests.allTests),
    ]
}
#endif

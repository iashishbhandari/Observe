import XCTest
@testable import Observe

class ObserveTests: XCTestCase {
    
    func testObserveValueInitializationIsValid() {
        XCTAssertNil(Observe<Any> {_ in }.newValue)
        XCTAssertNil(Observe<AnyObject> {_ in }.newValue)
    }

    func testObserveAnOptionalValueDidNotifiesCorrectly() {
        var notificationCount = 0
        let sut = Observe<String?> { _ in notificationCount += 1}
        XCTAssertEqual(notificationCount, 0)
        sut.newValue = "a"
        XCTAssertEqual(notificationCount, 1)
        sut.newValue = "b"
        sut.newValue = nil
        XCTAssertEqual(notificationCount, 3)
    }
    
    func testObserveANonOptionalValueNotifiesCorrectly() {
        var notificationCount = 0
        let sut = Observe<Int> { _ in notificationCount += 1}
        XCTAssertEqual(notificationCount, 0)
        sut.newValue = 1
        XCTAssertEqual(notificationCount, 1)
        sut.newValue = 2
        XCTAssertEqual(notificationCount, 2)
    }
}


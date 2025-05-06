import XCTest
@testable import MovieQuiz

final class ArrayTests: XCTestCase {

    func testValidIndexReturnsElement() {
        let array = [1, 2, 3]
        let element = array[safe: 1]
        XCTAssertEqual(element, 2, "Элемент по индексу 1 должен быть равен 2")
    }

    func testInvalidIndexReturnsNil() {
        let array = [1, 2, 3]
        let element = array[safe: 10]
        XCTAssertNil(element, "Элемент по несуществующему индексу должен быть nil")
    }
}

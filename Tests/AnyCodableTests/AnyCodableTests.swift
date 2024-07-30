/// Created by nipun Weerakkodi on 31.07.24.

import XCTest
@testable import AnyCodable

final class AnyCodableTests: XCTestCase {

    func testString() throws {
        let value = "Hello, World!"
        let anyCodable = AnyCodable(value)
        
        let encodedData = try JSONEncoder().encode(anyCodable)
        let decodedAnyCodable = try JSONDecoder().decode(AnyCodable.self, from: encodedData)
        
        XCTAssertEqual(decodedAnyCodable.getValue(as: String.self), value)
    }
    
    func testInt() throws {
        let value = 42
        let anyCodable = AnyCodable(value)
        
        let encodedData = try JSONEncoder().encode(anyCodable)
        let decodedAnyCodable = try JSONDecoder().decode(AnyCodable.self, from: encodedData)
        
        XCTAssertEqual(decodedAnyCodable.getValue(as: Int.self), value)
    }
    
    func testDouble() throws {
        let value = 3.14159
        let anyCodable = AnyCodable(value)
        
        let encodedData = try JSONEncoder().encode(anyCodable)
        let decodedAnyCodable = try JSONDecoder().decode(AnyCodable.self, from: encodedData)
        
        XCTAssertEqual(decodedAnyCodable.getValue(as: Double.self), value)
    }
    
    func testBool() throws {
        let value = true
        let anyCodable = AnyCodable(value)
        
        let encodedData = try JSONEncoder().encode(anyCodable)
        let decodedAnyCodable = try JSONDecoder().decode(AnyCodable.self, from: encodedData)
        
        XCTAssertEqual(decodedAnyCodable.getValue(as: Bool.self), value)
    }

    func testArray() throws {
        let value: [AnyCodable] = [AnyCodable(1), AnyCodable("two"), AnyCodable(3.0)]
        let anyCodable = AnyCodable(value)
        
        let encodedData = try JSONEncoder().encode(anyCodable)
        let decodedAnyCodable = try JSONDecoder().decode(AnyCodable.self, from: encodedData)
        
        let decodedArray = decodedAnyCodable.getValue(as: [AnyCodable].self)
        XCTAssertEqual(decodedArray?.count, value.count)
        XCTAssertEqual(decodedArray?[0].getValue(as: Int.self), 1)
        XCTAssertEqual(decodedArray?[1].getValue(as: String.self), "two")
        XCTAssertEqual(decodedArray?[2].getValue(as: Double.self), 3.0)
    }

    func testDictionary() throws {
        let value: [String: AnyCodable] = ["int": AnyCodable(1), "string": AnyCodable("two"), "double": AnyCodable(3.0)]
        let anyCodable = AnyCodable(value)
        
        let encodedData = try JSONEncoder().encode(anyCodable)
        let decodedAnyCodable = try JSONDecoder().decode(AnyCodable.self, from: encodedData)
        
        let decodedDict = decodedAnyCodable.getValue(as: [String: AnyCodable].self)
        XCTAssertEqual(decodedDict?.count, value.count)
        XCTAssertEqual(decodedDict?["int"]?.getValue(as: Int.self), 1)
        XCTAssertEqual(decodedDict?["string"]?.getValue(as: String.self), "two")
        XCTAssertEqual(decodedDict?["double"]?.getValue(as: Double.self), 3.0)
    }
    
    func testTuple() throws {
        let value = (AnyCodable(1), AnyCodable("two"))
        let anyCodable = AnyCodable([value.0, value.1])
        
        let encodedData = try JSONEncoder().encode(anyCodable)
        let decodedAnyCodable = try JSONDecoder().decode(AnyCodable.self, from: encodedData)
        
        if let decodedArray = decodedAnyCodable.getValue(as: [AnyCodable].self),
           decodedArray.count == 2 {
            XCTAssertEqual(decodedArray[0].getValue(as: Int.self), 1)
            XCTAssertEqual(decodedArray[1].getValue(as: String.self), "two")
        } else {
            XCTFail("Decoded value is not a tuple.")
        }
    }

    func testData() throws {
        let value = Data([0x01, 0x02, 0x03])
        let anyCodable = AnyCodable(value)
        
        let encodedData = try JSONEncoder().encode(anyCodable)
        let decodedAnyCodable = try JSONDecoder().decode(AnyCodable.self, from: encodedData)
        
        XCTAssertEqual(decodedAnyCodable.getValue(as: Data.self), value)
    }

    func testDate() throws {
        let value = Date()
        let anyCodable = AnyCodable(value)
        
        let encodedData = try JSONEncoder().encode(anyCodable)
        let decodedAnyCodable = try JSONDecoder().decode(AnyCodable.self, from: encodedData)
        
        XCTAssertEqual(decodedAnyCodable.getValue(as: Date.self), value)
    }

    func testURL() throws {
        let value = URL(string: "https://www.example.com")!
        let anyCodable = AnyCodable(value)
        
        let encodedData = try JSONEncoder().encode(anyCodable)
        let decodedAnyCodable = try JSONDecoder().decode(AnyCodable.self, from: encodedData)
        
        XCTAssertEqual(decodedAnyCodable.getValue(as: URL.self), value)
    }

    func testDecimal() throws {
        let value = Decimal(3.14)
        let anyCodable = AnyCodable(value)
        
        let encodedData = try JSONEncoder().encode(anyCodable)
        let decodedAnyCodable = try JSONDecoder().decode(AnyCodable.self, from: encodedData)
        
        XCTAssertEqual(decodedAnyCodable.getValue(as: Decimal.self), value)
    }
}


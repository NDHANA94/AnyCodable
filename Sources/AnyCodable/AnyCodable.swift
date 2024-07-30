// The Swift Programming Language
// https://docs.swift.org/swift-book


import Foundation

public struct AnyCodable: Codable {
    private let value: Any
    private let type: String

    public init(_ value: Any) {
        self.value = value

        // Determine the type as a string
        switch value {
        case is String:
            self.type = "String"
        case is UInt:
            self.type = "UInt"
        case is UInt8:
            self.type = "UInt8"
        case is UInt16:
            self.type = "UInt16"
        case is UInt32:
            self.type = "UInt32"
        case is UInt64:
            self.type = "UInt64"
        case is Int:
            self.type = "Int"
        case is Int8:
            self.type = "Int8"
        case is Int16:
            self.type = "Int16"
        case is Int32:
            self.type = "Int32"
        case is Int64:
            self.type = "Int64"
        case is Float:
            self.type = "Float"
        case is Double:
            self.type = "Double"
        case is Bool:
            self.type = "Bool"
        case is [AnyCodable]:
            self.type = "Array"
        case is [String: AnyCodable]:
            self.type = "Dictionary"
        case is (AnyCodable, AnyCodable):
            self.type = "Tuple"
        case is Data:
            self.type = "Data"
        case is Date:
            self.type = "Date"
        case is URL:
            self.type = "URL"
        case is Decimal:
            self.type = "Decimal"
        default:
            self.type = "Unsupported"
        }
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        type = try container.decode(String.self, forKey: .type)

        switch type {
        case "String":
            value = try container.decode(String.self, forKey: .value)
        case "UInt":
            value = try container.decode(UInt.self, forKey: .value)
        case "UInt8":
            value = try container.decode(UInt8.self, forKey: .value)
        case "UInt16":
            value = try container.decode(UInt16.self, forKey: .value)
        case "UInt32":
            value = try container.decode(UInt32.self, forKey: .value)
        case "UInt64":
            value = try container.decode(UInt64.self, forKey: .value)
        case "Int":
            value = try container.decode(Int.self, forKey: .value)
        case "Int8":
            value = try container.decode(Int8.self, forKey: .value)
        case "Int16":
            value = try container.decode(Int16.self, forKey: .value)
        case "Int32":
            value = try container.decode(Int32.self, forKey: .value)
        case "Int64":
            value = try container.decode(Int64.self, forKey: .value)
        case "Float":
            value = try container.decode(Float.self, forKey: .value)
        case "Double":
            value = try container.decode(Double.self, forKey: .value)
        case "Bool":
            value = try container.decode(Bool.self, forKey: .value)
        case "Array":
            value = try container.decode([AnyCodable].self, forKey: .value)
        case "Dictionary":
            value = try container.decode([String: AnyCodable].self, forKey: .value)
        case "Tuple":
            let array = try container.decode([AnyCodable].self, forKey: .value)
            value = (array[0].value, array[1].value)
        case "Data":
            value = try container.decode(Data.self, forKey: .value)
        case "Date":
            value = try container.decode(Date.self, forKey: .value)
        case "URL":
            value = try container.decode(URL.self, forKey: .value)
        case "Decimal":
            value = try container.decode(Decimal.self, forKey: .value)
        default:
            throw DecodingError.dataCorruptedError(forKey: .type, in: container, debugDescription: "Unsupported type")
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(type, forKey: .type)

        switch value {
        case let string as String:
            try container.encode(string, forKey: .value)
        case let uint as UInt:
            try container.encode(uint, forKey: .value)
        case let uint8 as UInt8:
            try container.encode(uint8, forKey: .value)
        case let uint16 as UInt16:
            try container.encode(uint16, forKey: .value)
        case let uint32 as UInt32:
            try container.encode(uint32, forKey: .value)
        case let uint64 as UInt64:
            try container.encode(uint64, forKey: .value)
        case let int as Int:
            try container.encode(int, forKey: .value)
        case let int8 as Int8:
            try container.encode(int8, forKey: .value)
        case let int16 as Int16:
            try container.encode(int16, forKey: .value)
        case let int32 as Int32:
            try container.encode(int32, forKey: .value)
        case let int64 as Int64:
            try container.encode(int64, forKey: .value)
        case let float as Float:
            try container.encode(float, forKey: .value)
        case let double as Double:
            try container.encode(double, forKey: .value)
        case let bool as Bool:
            try container.encode(bool, forKey: .value)
        case let array as [AnyCodable]:
            try container.encode(array, forKey: .value)
        case let dictionary as [String: AnyCodable]:
            try container.encode(dictionary, forKey: .value)
        case let tuple as (Any, Any):
            let array = [AnyCodable(tuple.0), AnyCodable(tuple.1)]
            try container.encode(array, forKey: .value)
        case let data as Data:
            try container.encode(data, forKey: .value)
        case let date as Date:
            try container.encode(date, forKey: .value)
        case let url as URL:
            try container.encode(url, forKey: .value)
        case let decimal as Decimal:
            try container.encode(decimal, forKey: .value)
        default:
            throw EncodingError.invalidValue(value, EncodingError.Context(codingPath: encoder.codingPath, debugDescription: "Unsupported type"))
        }
    }

    private enum CodingKeys: String, CodingKey {
        case type
        case value
    }

    public func getValue<T: Codable>(as type: T.Type) -> T? {
        return value as? T
    }
}

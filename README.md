# AnyCodable
Swift AnyCodable package.


AnyCodable is a Swift package designed to provide a flexible and type-safe way to encode and decode heterogeneous data types within a single 
structure. This package is particularly useful for scenarios where you need to work with various data types dynamically, such as when handling JSON 
data with mixed types.

### Features:
**Supports Multiple Types:** AnyCodable supports encoding and decoding of a wide range of Swift types, including:
- Standard types: String, Int, UInt, Float, Double, Bool
- Integer types: Int8, Int16, Int32, Int64, UInt8, UInt16, UInt32, UInt64
- Collection types: Array, Dictionary
- Special types: Data, Date, URL, Decimal
- Custom types: Tuples (as (Any, Any))

**Type Safety:** The package ensures type safety by using runtime type checking and encoding the type information along with the value.

**Easy Integration:** Simply integrate AnyCodable into your Swift project and start using it to handle mixed-type data effortlessly.

### Installation
Swift Package Manager
Add AnyCodable to your Package.swift file:

```swift
dependencies: [
    .package(url: "https://github.com/yourusername/AnyCodable.git", from: "1.0.0")
]
```

And include "AnyCodable" as a dependency for your target:

```swift
.target(
    name: "YourTargetName",
    dependencies: ["AnyCodable"]),
```

### Usage
- **Encoding and Decoding**
AnyCodable can be used to encode and decode various types dynamically:

```swift
import AnyCodable

let anyCodableString = AnyCodable("Hello, World!")
let anyCodableInt = AnyCodable(42)
let anyCodableArray = AnyCodable([AnyCodable(1), AnyCodable("two"), AnyCodable(3.0)])
let anyCodableDict = AnyCodable(["int": AnyCodable(1), "string": AnyCodable("two")])
let anyCodableTuple = AnyCodable((AnyCodable(1), AnyCodable("two")))

// Encoding
let encodedData = try JSONEncoder().encode(anyCodableString)

// Decoding
let decodedAnyCodable = try JSONDecoder().decode(AnyCodable.self, from: encodedData)
let decodedValue = decodedAnyCodable.getValue(as: String.self)
print(decodedValue)  // Output: Optional("Hello, World!")
```

### Handling Different Types
AnyCodable supports a wide range of types:

```swift
let dataValue = Data([0x01, 0x02, 0x03])
let dateValue = Date()
let urlValue = URL(string: "https://www.example.com")!
let decimalValue = Decimal(3.14)

let anyCodableData = AnyCodable(dataValue)
let anyCodableDate = AnyCodable(dateValue)
let anyCodableURL = AnyCodable(urlValue)
let anyCodableDecimal = AnyCodable(decimalValue)

// Encoding and decoding work similarly as shown above
```

### Testing
AnyCodable comes with a suite of unit tests to ensure its reliability. You can run the tests using Xcode or via the command line:
```bash
swift test
```



### License
This project is licensed under the Apache 2.0 License. See the LICENSE file for details.



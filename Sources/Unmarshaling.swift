//
//  M A R S H A L
//
//       ()
//       /\
//  ()--'  '--()
//    `.    .'
//     / .. \
//    ()'  '()
//
//


import Foundation


public protocol Unmarshaling: ValueType {
    associatedtype ConvertibleType = Self
    
    init(object: MarshaledObject) throws
}

extension Unmarshaling {
    
    public static func value(_ object: Any) throws -> ConvertibleType {
        guard let convertedObject = object as? MarshaledObject else {
            throw MarshalError.typeMismatch(expected: MarshaledObject.self, actual: object.dynamicType)
        }
        guard let value = try self.init(object: convertedObject) as? ConvertibleType else {
            throw MarshalError.typeMismatch(expected: ConvertibleType.self, actual: object.dynamicType)
        }
        return value
    }
    
}

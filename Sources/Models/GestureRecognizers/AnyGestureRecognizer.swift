//
//  AnyGestureRecognizer.swift
//  IBDecodable
//
//  Created by blz on 27/03/2025.
//

public struct AnyGestureRecognizer: IBDecodable {

    public let gestureRecognizer: GestureRecognizerProtocol

    init(_ gestureRecognizer: GestureRecognizerProtocol) {
        self.gestureRecognizer = gestureRecognizer
    }

    public func encode(to encoder: Encoder) throws { fatalError() }

    static func decode(_ xml: XMLIndexerType) throws -> Self {
        guard let elementName = xml.elementName else { throw IBError.elementNotFound }
        return switch elementName {
        case "tapGestureRecognizer": try AnyGestureRecognizer(TapGestureRecognizer.decode(xml))
        case "pinchGestureRecognizer": try AnyGestureRecognizer(PinchGestureRecognizer.decode(xml))
        default: throw IBError.unsupportedGestureRecognizer(elementName)
        }
    }
}

extension AnyGestureRecognizer: IBAny {

    public typealias NestedElement = GestureRecognizerProtocol
    public var nested: GestureRecognizerProtocol {
        return gestureRecognizer
    }
}

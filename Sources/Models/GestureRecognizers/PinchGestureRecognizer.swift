//
//  PinchGestureRecognizer.swift
//  IBDecodable
//
//  Created by blz on 27/03/2025.
//

import Foundation

public struct PinchGestureRecognizer: IBDecodable, GestureRecognizerProtocol {

    public let id: String
    
    public let customClass: String?
    public let customModule: String?
    public let customModuleProvider: String?
    
    public let userLabel: String?
    public let colorLabel: String?
    
    public let connections: [AnyConnection]?
    
    static func decode(_ xml: XMLIndexerType) throws -> Self {
        let container = xml.container(keys: CodingKeys.self)
        return Self(
            id:                     try container.attribute(of: .id),
            customClass:            container.attributeIfPresent(of: .customClass),
            customModule:           container.attributeIfPresent(of: .customModule),
            customModuleProvider:   container.attributeIfPresent(of: .customModuleProvider),
            userLabel:              container.attributeIfPresent(of: .userLabel),
            colorLabel:             container.attributeIfPresent(of: .colorLabel),
            connections:            container.childrenIfPresent(of: .connections)
        )
    }
}

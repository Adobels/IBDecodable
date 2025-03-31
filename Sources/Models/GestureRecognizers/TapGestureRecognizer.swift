//
//  TapGestureRecognizer.swift
//  IBDecodable
//
//  Created by Blazej SLEBODA on 25/03/2025.
//

import SWXMLHash

public struct TapGestureRecognizer: IBDecodable, GestureRecognizerProtocol, IBConnectionOwner {
    
    public let id: String
    
    public let customClass: String?
    public let customModule: String?
    public let customModuleProvider: String?
    
    public let userLabel: String?
    public let colorLabel: String?
    
    public let enabled: Bool?
    public let cancelsTouchesInView: Bool?
    public let delaysTouchesBegan: Bool?
    public let delaysTouchesEnded: Bool?
    public let requiresExclusiveTouchType: Bool?
    public let numberOfTapsRequired: Int?
    public let numberOfTouchesRequired : Int?
    
    public let connections: [AnyConnection]?
    
    static func decode(_ xml: XMLIndexerType) throws -> TapGestureRecognizer {
        let container = xml.container(keys: CodingKeys.self)
        return TapGestureRecognizer(
            id:                     try container.attribute(of: .id),
            customClass:            container.attributeIfPresent(of: .customClass),
            customModule:           container.attributeIfPresent(of: .customModule),
            customModuleProvider:   container.attributeIfPresent(of: .customModuleProvider),
            userLabel:              container.attributeIfPresent(of: .userLabel),
            colorLabel:             container.attributeIfPresent(of: .colorLabel),
            enabled:                container.attributeIfPresent(of: .enabled),
            cancelsTouchesInView:   container.attributeIfPresent(of: .cancelsTouchesInView),
            delaysTouchesBegan:     container.attributeIfPresent(of: .delaysTouchesBegan),
            delaysTouchesEnded:     container.attributeIfPresent(of: .delaysTouchesEnded),
            requiresExclusiveTouchType: container.attributeIfPresent(of: .requiresExclusiveTouchType),
            numberOfTapsRequired:   container.attributeIfPresent(of: .numberOfTapsRequired),
            numberOfTouchesRequired: container.attributeIfPresent(of: .numberOfTouchesRequired),
            connections:            container.childrenIfPresent(of: .connections)
        )
    }
}

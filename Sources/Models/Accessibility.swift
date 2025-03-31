//
//  Accessibility.swift
//  IBDecodable
//
//  Created by phimage on 10/05/2018.
//

import SWXMLHash

// MARK: - Accessibility

public struct Accessibility: IBDecodable, IBKeyable {

    public let key: String?
    public let label: String?
    public let hint: String?
    public let identifier: String?
    public let traits: AccessibilityTraits?
    public let isElement: IBBool?

    enum ExternalCodingKeys: CodingKey { case accessibilityTraits, bool }
    enum AttributedStringCodingKeys: CodingKey { case key }

    static func decode(_ xml: XMLIndexerType) throws -> Accessibility {
        let container = xml.container(keys: CodingKeys.self)
        let accessibilityTraitsContainer = xml.container(keys: ExternalCodingKeys.self)
            .nestedContainerIfPresent(of: .accessibilityTraits, keys: AttributedStringCodingKeys.self)
        let boolContainer = xml.container(keys: ExternalCodingKeys.self)
            .nestedContainerIfPresent(of: .bool, keys: AttributedStringCodingKeys.self)
        return Accessibility(
            key: container.attributeIfPresent(of: .key),
            label: container.attributeIfPresent(of: .label),
            hint: container.attributeIfPresent(of: .hint),
            identifier: container.attributeIfPresent(of: .identifier),
            traits: accessibilityTraitsContainer?.withAttributeElement(.key, CodingKeys.traits.stringValue),
            isElement: boolContainer?.withAttributeElement(.key, CodingKeys.isElement.stringValue)
        )
    }

}

// MARK: - AccessibilityTraits

public struct AccessibilityTraits: IBDecodable, IBKeyable {

    public let key: String?
    public let button: Bool?
    public let image: Bool?
    public let staticText: Bool?
    public let searchField: Bool?
    public let playsSound: Bool?
    public let keyboardKey: Bool?
    public let summaryElement: Bool?
    public let notEnabled: Bool?
    public let updatesFrequently: Bool?
    public let startsMediaSession: Bool?
    public let adjustable: Bool?
    public let allowsDirectInteraction: Bool?
    public let causesPageTurn: Bool?
    public let header: Bool?
    public let link: Bool?
    public let selected: Bool?

    static func decode(_ xml: XMLIndexerType) throws -> AccessibilityTraits {
        let container = xml.container(keys: CodingKeys.self)
        return AccessibilityTraits(
            key: container.attributeIfPresent(of: .key),
            button: container.attributeIfPresent(of: .button),
            image: container.attributeIfPresent(of: .image),
            staticText: container.attributeIfPresent(of: .staticText),
            searchField: container.attributeIfPresent(of: .searchField),
            playsSound: container.attributeIfPresent(of: .playsSound),
            keyboardKey: container.attributeIfPresent(of: .keyboardKey),
            summaryElement: container.attributeIfPresent(of: .summaryElement),
            notEnabled: container.attributeIfPresent(of: .notEnabled),
            updatesFrequently: container.attributeIfPresent(of: .updatesFrequently),
            startsMediaSession: container.attributeIfPresent(of: .startsMediaSession),
            adjustable: container.attributeIfPresent(of: .adjustable),
            allowsDirectInteraction: container.attributeIfPresent(of: .allowsDirectInteraction),
            causesPageTurn: container.attributeIfPresent(of: .causesPageTurn),
            header: container.attributeIfPresent(of: .header),
            link: container.attributeIfPresent(of: .link),
            selected: container.attributeIfPresent(of: .selected)
        )
    }
}

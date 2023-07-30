//
//  Action.swift
//  BusCat
//
//  Created by Dr. Brandon Wiley on 7/29/23.
//

import Foundation
import SwiftUI

public struct Action
{
    public let name: String
    public let image: Image
    public let callback: (GameState) -> Void
    public let hidden: Bool

    public init(name: String, imageName: String, hidden: Bool = false, callback: @escaping (GameState) -> Void)
    {
        let image = Image(systemName: imageName)

        self.init(name: name, image: image, hidden: hidden, callback: callback)
    }

    public init(name: String, image: Image, hidden: Bool = false, callback: @escaping (GameState) -> Void)
    {
        self.name = name
        self.image = image
        self.hidden = hidden
        self.callback = callback
    }
}

extension Action: Identifiable
{
    public var id: ObjectIdentifier
    {
        return ObjectIdentifier(ActionIdentifier(self.name))
    }
}

public class ActionIdentifier
{
    public let name: String

    public init(_ name: String)
    {
        self.name = name
    }
}

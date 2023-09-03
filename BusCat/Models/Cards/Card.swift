//
//  Card.swift
//  BusCat
//
//  Created by Dr. Brandon Wiley on 8/31/23.
//

import Foundation
import SwiftUI

public class Card
{
    public let name: String
    public let size: CardSize
    public let front: Image
    public let back: Image
    public let identifier: UUID
    public var faceUp: Bool

    public init(name: String, size: CardSize, front: Image, back: Image, identifier: UUID, faceUp: Bool = false)
    {
        self.name = name
        self.size = size
        self.front = front
        self.back = back
        self.identifier = identifier
        self.faceUp = faceUp
    }

    public func flip()
    {
        self.faceUp = !self.faceUp
    }

    public func turnFaceUp()
    {
        self.faceUp = true
    }

    public func turnFaceDown()
    {
        self.faceUp = false
    }

    func getImage() -> Image
    {
        if self.faceUp
        {
            return self.front
        }
        else
        {
            return self.back
        }
    }
}

extension Card: Equatable
{
    public static func == (lhs: Card, rhs: Card) -> Bool
    {
        return lhs.identifier == rhs.identifier
    }
}

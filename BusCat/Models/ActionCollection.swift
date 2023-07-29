//
//  ActionCollection.swift
//  BusCat
//
//  Created by Dr. Brandon Wiley on 7/29/23.
//

import Foundation

public struct ActionCollection
{
    public var actions: [Action]

    public init()
    {
        self.actions = []
    }

    public init(actions: [Action])
    {
        self.actions = actions
    }

    mutating public func addAction(action: Action) throws
    {
        guard self.actions.count < 8 else
        {
            throw ActionCollectionError.tooManyActions
        }

        self.actions.append(action)
    }
}

public enum ActionCollectionError: Error
{
    case tooManyActions
}

//
//  ActionCollections.swift
//  BusCat
//
//  Created by Dr. Brandon Wiley on 7/29/23.
//

import Foundation

public struct ActionCollections
{
    static public func nothing(_ navigation: GameState)
    {
        // Do nothing
    }
}

// Top
extension ActionCollections
{
    static public let top = ActionCollection(actions: [
        Action(name: "starmap", imageName: "map", callback: Self.starmap),
        Action(name: "backpack", imageName: "backpack", hidden: false, callback: Self.backpack),
        Action(name: "nothing", imageName: "circle.slash", hidden: true, callback: Self.nothing),
        Action(name: "nothing", imageName: "circle.slash", hidden: true, callback: Self.nothing),
        Action(name: "nothing", imageName: "circle.slash", hidden: true, callback: Self.nothing),
        Action(name: "nothing", imageName: "circle.slash", hidden: true, callback: Self.nothing),
        Action(name: "nothing", imageName: "circle.slash", hidden: true, callback: Self.nothing),
        Action(name: "nothing", imageName: "circle.slash", hidden: true, callback: Self.nothing),
    ])

    static public func starmap(_ state: GameState)
    {
        state.currentView = .galaxyMap
        state.sceneType = .none
    }

    static public func backpack(_ state: GameState)
    {
        state.currentView = .backpack
    }
}

// Bottom
extension ActionCollections
{
    static public let bottom = ActionCollection(actions: [
        Action(name: "fishing", imageName: "figure.fishing", callback: Self.fishing),
        Action(name: "nothing", imageName: "circle.slash", hidden: true, callback: Self.nothing),
        Action(name: "nothing", imageName: "circle.slash", hidden: true, callback: Self.nothing),
        Action(name: "nothing", imageName: "circle.slash", hidden: true, callback: Self.nothing),
        Action(name: "nothing", imageName: "circle.slash", hidden: true, callback: Self.nothing),
        Action(name: "nothing", imageName: "circle.slash", hidden: true, callback: Self.nothing),
        Action(name: "nothing", imageName: "circle.slash", hidden: true, callback: Self.nothing),
        Action(name: "nothing", imageName: "circle.slash", hidden: true, callback: Self.nothing),
    ])

    static public func fishing(_ state: GameState)
    {
        print("fishing")

        guard let index = state.backpack.groups[0].findEmptySpace() else
        {
            print("no free backpack slots")
            return
        }

        print("fish -> (0, \(index))")
        state.backpack.groups[0].items[index] = Item.fish
        state.objectWillChange.send() // FIXME - This is a hack, there should be a way to get around doing this explictly.
    }
}

// Left
extension ActionCollections
{
    static public let left = ActionCollection(actions: [
        Action(name: "fish", imageName: "fish", callback: Self.fish),
        Action(name: "nothing", imageName: "circle.slash", hidden: true, callback: Self.nothing),
        Action(name: "nothing", imageName: "circle.slash", hidden: true, callback: Self.nothing),
        Action(name: "nothing", imageName: "circle.slash", hidden: true, callback: Self.nothing),
        Action(name: "nothing", imageName: "circle.slash", hidden: true, callback: Self.nothing),
        Action(name: "nothing", imageName: "circle.slash", hidden: true, callback: Self.nothing),
        Action(name: "nothing", imageName: "circle.slash", hidden: true, callback: Self.nothing),
        Action(name: "nothing", imageName: "circle.slash", hidden: true, callback: Self.nothing),
    ])

    static public func fish(_ state: GameState)
    {

    }
}

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
    static public let sceneTop = ActionCollection(actions: [
        Action(name: "starmap", imageName: "map", callback: Self.starmap),
        Action(name: "backpack", imageName: "backpack", hidden: false, callback: Self.backpack),
        Action(name: "nothing", imageName: "circle.slash", hidden: true, callback: Self.nothing),
        Action(name: "nothing", imageName: "circle.slash", hidden: true, callback: Self.nothing),
        Action(name: "nothing", imageName: "circle.slash", hidden: true, callback: Self.nothing),
        Action(name: "nothing", imageName: "circle.slash", hidden: true, callback: Self.nothing),
        Action(name: "nothing", imageName: "circle.slash", hidden: true, callback: Self.nothing),
        Action(name: "nothing", imageName: "circle.slash", hidden: true, callback: Self.nothing),
    ])

    static public let shipTop = ActionCollection(actions: [
        Action(name: "starmap", imageName: "map", callback: Self.starmap),
        Action(name: "backpack", imageName: "backpack", hidden: false, callback: Self.backpack),
        Action(name: "nothing", imageName: "circle.slash", hidden: true, callback: Self.nothing),
        Action(name: "nothing", imageName: "circle.slash", hidden: true, callback: Self.nothing),
        Action(name: "nothing", imageName: "circle.slash", hidden: true, callback: Self.nothing),
        Action(name: "nothing", imageName: "circle.slash", hidden: true, callback: Self.nothing),
        Action(name: "nothing", imageName: "circle.slash", hidden: true, callback: Self.nothing),
        Action(name: "nothing", imageName: "circle.slash", hidden: true, callback: Self.nothing),
    ])

    static public let activityTop = ActionCollection(actions: [
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
        state.scene = SceneCollections.space.empty
    }

    static public func backpack(_ state: GameState)
    {
        state.backView = state.currentView
        state.backScene = state.scene

        state.currentView = .backpack
    }

    static public func scene(_ state: GameState)
    {
        state.currentView = .scene
    }
}

// Bottom
extension ActionCollections
{
    static public let sceneBottom = ActionCollection(actions: [
        Action(name: "fishing", imageName: "figure.fishing", callback: Self.fishing),
        Action(name: "nothing", imageName: "circle.slash", hidden: true, callback: Self.nothing),
        Action(name: "nothing", imageName: "circle.slash", hidden: true, callback: Self.nothing),
        Action(name: "nothing", imageName: "circle.slash", hidden: true, callback: Self.nothing),
        Action(name: "nothing", imageName: "circle.slash", hidden: true, callback: Self.nothing),
        Action(name: "nothing", imageName: "circle.slash", hidden: true, callback: Self.nothing),
        Action(name: "nothing", imageName: "circle.slash", hidden: true, callback: Self.nothing),
        Action(name: "nothing", imageName: "circle.slash", hidden: true, callback: Self.nothing),
    ])

    static public let fishingBottom = ActionCollection(actions: [
        Action(name: "fishing", imageName: "figure.fishing", callback: Self.fishingActivity),
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
        state.currentView = .fishing
    }

    static public func fishingActivity(_ state: GameState)
    {
        print("fishing \(state.scene.type)")

        guard state.scene.type == .planet else
        {
            print("You can't fish here!")
            return
        }

        guard let index = state.backpack.groups[state.itemGroup].findEmptySpace() else
        {
            print("no free backpack slots")
            return
        }

        print("fish -> (\(state.itemGroup), \(index))")
        state.backpack.groups[state.itemGroup].items[index] = Item.fish
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

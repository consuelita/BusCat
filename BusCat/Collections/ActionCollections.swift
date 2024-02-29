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

    static public let shipBottom = ActionCollection(actions: [
        Action(name: "console", imageName: "gamecontroller", hidden: false, callback: Self.cryogenics),
        Action(name: "nothing", imageName: "circle.slash", hidden: true, callback: Self.nothing),
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

    static public func cryogenics(_ state: GameState)
    {
        state.backView = state.currentView
        state.backScene = state.scene

        state.currentView = .cryogenics
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
        guard state.scene.type == .planet else
        {
            print("You can't fish here!")
            return
        }

        state.currentView = .fishing
    }

    static public func fishingActivity(_ state: GameState)
    {
        print("fishing \(state.scene.type)")
        
        // TODO: Check if user has the fishing skill before allowing them to fish
    

        guard state.scene.type == .planet else
        {
            print("You can't fish here!")
            return
        }
        
        // TODO: First see if we can add this to an existing stack of the same item (item count)
        // TODO: Otherwise, iterate through all available item groups until we find one that has an empty space
        // TODO: Display the correct column in the UI as well
//        guard let index = state.backpack.groups[state.itemGroup].findEmptySpace() else
//        {
//            print("no free backpack slots")
//            return
//        }
//
//        print("fish -> (\(state.itemGroup), \(index))")
//        state.backpack.groups[state.itemGroup].items[index] = Item.fish
        
        // TODO: Handle when item can't be stored (no space!)
        // TODO: Have try to store return which group the item is stored in so that we can display it
        let itemStored = state.backpack.tryToStore(item: Item.fish)
        
        if itemStored
        {
            print("🐠 Stored a fish!!")
        }
        else
        {
            print("🐠🚫 Did NOT store a fish!!")
        }
        
        state.objectWillChange.send() // FIXME - This is a hack, there should be a way to get around doing this explicitly.
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

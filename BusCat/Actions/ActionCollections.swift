//
//  TopActions.swift
//  BusCat
//
//  Created by Dr. Brandon Wiley on 7/29/23.
//

import Foundation

public struct ActionCollections
{
    static public func nothing(_ navigation: GameNavigation)
    {
        // Do nothing
    }
}

// Top
extension ActionCollections
{
    static public let top = ActionCollection(actions: [
        Action(name: "starmap", imageName: "map", callback: Self.starmap),
        Action(name: "nothing", imageName: "circle.slash", hidden: true, callback: Self.nothing),
        Action(name: "nothing", imageName: "circle.slash", hidden: true, callback: Self.nothing),
        Action(name: "nothing", imageName: "circle.slash", hidden: true, callback: Self.nothing),
        Action(name: "nothing", imageName: "circle.slash", hidden: true, callback: Self.nothing),
        Action(name: "nothing", imageName: "circle.slash", hidden: true, callback: Self.nothing),
        Action(name: "nothing", imageName: "circle.slash", hidden: true, callback: Self.nothing),
        Action(name: "nothing", imageName: "circle.slash", hidden: true, callback: Self.nothing),
    ])


    static public func starmap(_ navigation: GameNavigation)
    {
        navigation.currentView = .galaxyMap
        navigation.sceneType = .none
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

    static public func fishing(_ navigation: GameNavigation)
    {

    }
}

// Bottom
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

    static public func fish(_ navigation: GameNavigation)
    {

    }
}

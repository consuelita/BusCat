//
//  SceneCollections.swift
//  BusCat
//
//  Created by Dr. Brandon Wiley on 7/31/23.
//

import Foundation

public struct SceneCollections
{
    static public let space = SpaceSceneCollection()
    static public let anomaly = AnomalySceneCollection()
    static public let star = StarSceneCollection()
    static public let planet = PlanetSceneCollection()
}

public struct SpaceSceneCollection
{
    public let empty = WaypointScene("Empty Space", .space, "Space")
}

public struct AnomalySceneCollection
{
    public let rainbow = WaypointScene("Rainbow Obelisk Anomaly", .anomaly, "AnomalyPlanetRainbow")
    public let fractal = WaypointScene("Fractal Mountains Anomaly", .anomaly, "FractalMountains")
    public let stars = WaypointScene("It's Full of Stars Anomaly", .anomaly, "FullOfStarsAnomaly")
}

public struct StarSceneCollection
{
    public let red = WaypointScene("Red Giant Star", .anomaly, "RedGiantStar")
}

public struct PlanetSceneCollection
{
    public let nature = WaypointScene("Garden Planet with a Pond", .anomaly, "NatureScene")
    public let water = WaypointScene("Water Planet", .anomaly, "WaterPlanet")
    public let garden = WaypointScene("Literal Garden Planet", .anomaly, "LotsOfFlowers")
    public let weird = WaypointScene("Weird Garden Planet", .anomaly, "RedBulbousPlanet")
}

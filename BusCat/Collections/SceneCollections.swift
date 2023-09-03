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
    static public let captain = CaptainSceneCollection()
    static public let navigation = NavigationSceneCollection()
    static public let engineering = EngineeringSceneCollection()
    static public let cryogenics = CryogenicsSceneCollection()
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
    public let whale = WaypointScene("Space Whale Skeleton", .anomaly, "SpaceWhaleSkeleton")
    public let wonderwall = WaypointScene("The Wonderwall", .anomaly, "Wonderwall")
}

public struct StarSceneCollection
{
    public let red = WaypointScene("Red Giant Star", .anomaly, "RedGiantStar")
}

public struct PlanetSceneCollection
{
    public let nature = WaypointScene("Lageto IV", .planet, "NatureScene")
    public let water = WaypointScene("Maro Prime", .planet, "WaterPlanet")
    public let garden = WaypointScene("Floranta III", .planet, "LotsOfFlowers")
    public let weird = WaypointScene("Nekutima", .planet, "RedBulbousPlant")
    public let desert = WaypointScene("Sablo Alpha", .planet, "Desert")
}

public struct CaptainSceneCollection
{
    public let ship1 = WaypointScene("Captains' Chair", .captain, "CaptainsChair1")
    public let ship2 = WaypointScene("Captains' Chair", .captain, "CaptainsChair2")
}

public struct NavigationSceneCollection
{
    public let ship1 = WaypointScene("Astronavigation", .astronavigation, "Astronavigation")
}

public struct EngineeringSceneCollection
{
    public let ship1 = WaypointScene("Engineering", .engineering, "Engineering")
}

public struct CryogenicsSceneCollection
{
    public let ship1 = WaypointScene("Cryogenics", .cryogenics, "Cryogenics")
}

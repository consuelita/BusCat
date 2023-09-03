//
//  CryogenicsMinigameView.swift
//  BusCat
//
//  Created by Dr. Brandon Wiley on 8/3/23.
//

import SwiftUI

struct CryogenicsMinigameView: View
{
    @EnvironmentObject var state: GameState

    @State var abilities: [Ability] = []
    @State var traits: [Trait] = []
    @State var worlds: Deck? = nil
    @State var professions: Deck = ProfessionsDeck()
    @State var backgrounds: Deck = BackgroundsDeck()
    @State var connections: Deck = ConnectionsDeck()
    @State var minigameState: CryogenicsGameState = CryogenicsGameState()

    @State var homeworld1: Card? = nil
    @State var homeworld2: Card? = nil
    @State var homeworld3: Card? = nil
    @State var homeworld4: Card? = nil

    @State var worldStack: Stack = Stack()

    @State var background1: Card? = nil
    @State var background2: Card? = nil
    @State var background3: Card? = nil
    @State var background4: Card? = nil

    let scaleFactor: CGFloat = 2
    let cardPadding: CGFloat = 10
    let defaultSize: CardSize = .poker

    var body: some View
    {
        switch $minigameState.wrappedValue.subview
        {
            case .main:
                self.mainView

            case .homeworlds:
                self.homeworldsView

            case .backgrounds:
                self.backgroundsView

            case .professions:
                self.professionsView

            case .connections:
                self.connectionsView
        }
    }

    var mainView: some View
    {
        VStack
        {
            Text("Recruit a New Crew Member from the Galactic Library")
                .foregroundColor(.accentColor)
                .font(.title)

            ZStack
            {
                HStack
                {
                    Button(action: self.sceneClicked)
                    {
                        if let image = NSImage(named: NSImage.Name(state.scene.imageName))
                        {
                            Image(nsImage: image)
                                .resizable()
                                .frame(width: 32, height: 32)
                                .padding(.leading, 64)
                                .padding(.top, 5)
                                .padding(.bottom, 0)
                        }
                    }
                    .buttonStyle(.plain)

                    Spacer()
                }

                HorizontalActionBar(actions: ActionCollections.activityTop)
                    .padding(.top, 5)
            }
            .padding()

            ZStack
            {
                if let image = NSImage(named: NSImage.Name("CryogenicsMinigame"))
                {
                    Image(nsImage: image)
                }

                HStack
                {
                    VStack
                    {
                        HStack
                        {
                            VStack
                            {
                                Text("Homeworld")

                                Button(action: self.homeworldsClicked)
                                {
                                    if let worlds = self.worlds
                                    {
                                        DeckView(deck: worlds, scaleFactor: self.scaleFactor)
                                    }
                                    else
                                    {
                                        Rectangle().frame(width: self.defaultSize.width * self.scaleFactor, height: self.defaultSize.height * self.scaleFactor)
                                    }
                                }
                                .buttonStyle(.plain)
                            }
                            .padding(.leading, self.cardPadding / 2)
                            .padding(.trailing, self.cardPadding)

                            VStack
                            {
                                Text("Background")

                                Button(action: self.backgroundsClicked)
                                {
                                    DeckView(deck: self.backgrounds, scaleFactor: self.scaleFactor)
                                }
                                .buttonStyle(.plain)
                            }
                            .padding(.leading, self.cardPadding)
                            .padding(.trailing, self.cardPadding / 2)

                            VStack
                            {
                                Text("Abilities")

                                VStack
                                {
                                    if abilities.isEmpty
                                    {
                                        Text("None")
                                    }
                                    else
                                    {
                                        ForEach($abilities, id: \.self)
                                        {
                                            ability in

                                            let type: String = ability.wrappedValue.type.rawValue
                                            let level = ability.wrappedValue.level.description
                                            Text("\(level) \(type)")
                                            .foregroundColor(.white)
                                        }
                                    }

                                    Spacer()
                                }
                                .frame(width: self.defaultSize.width * self.scaleFactor, height: self.defaultSize.height * self.scaleFactor)
                            }
                        }

                        HStack
                        {
                            VStack
                            {
                                Text("Profession")

                                Button(action: self.professionsClicked)
                                {
                                    DeckView(deck: self.professions, scaleFactor: self.scaleFactor)
                                }
                                .buttonStyle(.plain)
                            }
                            .padding(.leading, self.cardPadding / 2)
                            .padding(.trailing, self.cardPadding)

                            VStack
                            {
                                Text("Connections")

                                Button(action: self.connectionsClicked)
                                {
                                    DeckView(deck: self.connections, scaleFactor: self.scaleFactor)
                                }
                                .buttonStyle(.plain)
                            }
                            .padding(.leading, self.cardPadding)
                            .padding(.trailing, self.cardPadding / 2)

                            VStack
                            {
                                Text("Traits")

                                VStack
                                {
                                    if traits.isEmpty
                                    {
                                        Text("None")
                                    }
                                    else
                                    {
                                        ForEach($traits, id: \.self)
                                        {
                                            trait in

                                            Text(trait.wrappedValue.description)
                                        }
                                    }

                                    Spacer()
                                }
                                .frame(width: self.defaultSize.width * self.scaleFactor, height: self.defaultSize.height * self.scaleFactor)
                            }
                        }
                    }
                }
                .foregroundColor(.primary)
                .font(.headline)
            }
        }
        .onAppear(perform: self.initialize)
    }

    var homeworldsView: some View
    {
        VStack
        {
            Text("Choose a Homeworld")
            .foregroundColor(.accentColor)
            .font(.title)

            ZStack
            {
                HStack
                {
                    Button(action: self.sceneClicked)
                    {
                        if let image = NSImage(named: NSImage.Name(state.scene.imageName))
                        {
                            Image(nsImage: image)
                                .resizable()
                                .frame(width: 32, height: 32)
                                .padding(.leading, 64)
                                .padding(.top, 5)
                                .padding(.bottom, 0)
                        }
                    }
                    .buttonStyle(.plain)

                    Button(action: self.minigameClicked)
                    {
                        if let image = NSImage(named: NSImage.Name("CryogenicsMinigame"))
                        {
                            Image(nsImage: image)
                                .resizable()
                                .frame(width: 32, height: 32)
                                .padding(.leading, 8)
                                .padding(.top, 5)
                                .padding(.bottom, 0)
                        }
                    }
                    .buttonStyle(.plain)

                    Spacer()
                }

                HorizontalActionBar(actions: ActionCollections.activityTop)
                    .padding(.top, 5)
            }
            .padding()

            ZStack
            {
                if let image = NSImage(named: NSImage.Name("Homeworlds"))
                {
                    Image(nsImage: image)
                }

                HStack
                {
                    VStack
                    {
                        HStack
                        {
                            VStack
                            {
                                if let homeworld1 = self.homeworld1
                                {
                                    Text(homeworld1.name)
                                    .foregroundColor(.white)

                                    Button(action: self.homeworld1Clicked)
                                    {
                                        CardView(card: homeworld1, scaleFactor: self.scaleFactor)
                                    }
                                    .buttonStyle(.plain)
                                }
                                else
                                {
                                    Text("")

                                    Rectangle().frame(width: self.defaultSize.width * self.scaleFactor, height: self.defaultSize.height * self.scaleFactor)
                                }
                            }
                            .padding(.leading, self.cardPadding / 2)
                            .padding(.trailing, self.cardPadding)

                            VStack
                            {
                                if let homeworld2 = self.homeworld2
                                {
                                    Text(homeworld2.name)
                                    .foregroundColor(.white)

                                    Button(action: self.homeworld2Clicked)
                                    {
                                        CardView(card: homeworld2, scaleFactor: self.scaleFactor)
                                    }
                                    .buttonStyle(.plain)
                                }
                                else
                                {
                                    Text("")

                                    Rectangle().frame(width: self.defaultSize.width * self.scaleFactor, height: self.defaultSize.height * self.scaleFactor)
                                }
                            }
                            .padding(.leading, self.cardPadding)
                            .padding(.trailing, self.cardPadding / 2)

                            VStack
                            {
                                Text("Abilities")
                                .foregroundColor(.white)

                                VStack
                                {
                                    if abilities.isEmpty
                                    {
                                        Text("None")
                                        .foregroundColor(.white)
                                    }
                                    else
                                    {
                                        ForEach($abilities, id: \.self)
                                        {
                                            ability in

                                            let type: String = ability.wrappedValue.type.rawValue
                                            let level = ability.wrappedValue.level.description
                                            Text("\(level) \(type)")
                                            .foregroundColor(.white)
                                        }
                                    }

                                    Spacer()
                                }
                                .frame(width: self.defaultSize.width * self.scaleFactor, height: self.defaultSize.height * self.scaleFactor)
                            }
                        }

                        HStack
                        {
                            VStack
                            {
                                if let homeworld3 = self.homeworld3
                                {
                                    Text(homeworld3.name)
                                    .foregroundColor(.white)

                                    Button(action: self.homeworld3Clicked)
                                    {
                                        CardView(card: homeworld3, scaleFactor: self.scaleFactor)
                                    }
                                    .buttonStyle(.plain)
                                }
                                else
                                {
                                    Text("")

                                    Rectangle().frame(width: self.defaultSize.width * self.scaleFactor, height: self.defaultSize.height * self.scaleFactor)
                                }
                            }
                            .padding(.leading, self.cardPadding / 2)
                            .padding(.trailing, self.cardPadding)

                            VStack
                            {
                                if let homeworld4 = self.homeworld4
                                {
                                    Text(homeworld4.name)
                                    .foregroundColor(.white)

                                    Button(action: self.homeworld4Clicked)
                                    {
                                        CardView(card: homeworld4, scaleFactor: self.scaleFactor)
                                    }
                                    .buttonStyle(.plain)
                                }
                                else
                                {
                                    Text("")

                                    Rectangle().frame(width: self.defaultSize.width * self.scaleFactor, height: self.defaultSize.height * self.scaleFactor)
                                }
                            }
                            .padding(.leading, self.cardPadding)
                            .padding(.trailing, self.cardPadding / 2)

                            VStack
                            {
                                Text("Traits")
                                .foregroundColor(.white)

                                VStack
                                {
                                    if traits.isEmpty
                                    {
                                        Text("None")
                                        .foregroundColor(.white)
                                    }
                                    else
                                    {
                                        ForEach($traits, id: \.self)
                                        {
                                            trait in

                                            Text(trait.wrappedValue.description)
                                        }
                                    }

                                    Spacer()
                                }
                                .foregroundColor(.white)
                                .frame(width: self.defaultSize.width * self.scaleFactor, height: self.defaultSize.height * self.scaleFactor)
                            }
                        }
                    }
                }
                .foregroundColor(.primary)
                .font(.headline)
            }
        }
        .onAppear(perform: self.initializeHomeworlds)
    }

    var backgroundsView: some View
    {
        VStack
        {
            Text("Choose a Background")
                .foregroundColor(.accentColor)
                .font(.title)

            ZStack
            {
                HStack
                {
                    Button(action: self.sceneClicked)
                    {
                        if let image = NSImage(named: NSImage.Name(state.scene.imageName))
                        {
                            Image(nsImage: image)
                                .resizable()
                                .frame(width: 32, height: 32)
                                .padding(.leading, 64)
                                .padding(.top, 5)
                                .padding(.bottom, 0)
                        }
                    }
                    .buttonStyle(.plain)

                    Button(action: self.minigameClicked)
                    {
                        if let image = NSImage(named: NSImage.Name("CryogenicsMinigame"))
                        {
                            Image(nsImage: image)
                                .resizable()
                                .frame(width: 32, height: 32)
                                .padding(.leading, 8)
                                .padding(.top, 5)
                                .padding(.bottom, 0)
                        }
                    }
                    .buttonStyle(.plain)

                    Spacer()
                }

                HorizontalActionBar(actions: ActionCollections.activityTop)
                    .padding(.top, 5)
            }
            .padding()

            ZStack
            {
                if let image = NSImage(named: NSImage.Name("BackgroundsDay"))
                {
                    Image(nsImage: image)
                }

                HStack
                {
                    VStack
                    {
                        HStack
                        {
                            VStack
                            {
                                if let background1 = self.background1
                                {
                                    Text(background1.name)
                                    .foregroundColor(.red)
                                    .shadow(color: .black, radius: 1)

                                    Button(action: self.background1Clicked)
                                    {
                                        CardView(card: background1, scaleFactor: self.scaleFactor)
                                    }
                                    .buttonStyle(.plain)
                                }
                                else
                                {
                                    Text("")

                                    Rectangle().frame(width: self.defaultSize.width * self.scaleFactor, height: self.defaultSize.height * self.scaleFactor)
                                }
                            }
                            .padding(.leading, self.cardPadding / 2)
                            .padding(.trailing, self.cardPadding)

                            VStack
                            {
                                if let background2 = self.background2
                                {
                                    Text(background2.name)
                                    .foregroundColor(.red)
                                    .shadow(color: .black, radius: 1)

                                    Button(action: self.background2Clicked)
                                    {
                                        CardView(card: background2, scaleFactor: self.scaleFactor)
                                    }
                                    .buttonStyle(.plain)
                                }
                                else
                                {
                                    Text("")

                                    Rectangle().frame(width: self.defaultSize.width * self.scaleFactor, height: self.defaultSize.height * self.scaleFactor)
                                }
                            }
                            .padding(.leading, self.cardPadding)
                            .padding(.trailing, self.cardPadding / 2)

                            VStack
                            {
                                Text("Abilities")
                                .foregroundColor(.red)
                                .shadow(color: .black, radius: 1)

                                VStack
                                {
                                    if abilities.isEmpty
                                    {
                                        Text("None")
                                        .foregroundColor(.red)
                                        .shadow(color: .black, radius: 1)
                                    }
                                    else
                                    {
                                        ForEach($abilities, id: \.self)
                                        {
                                            ability in

                                            let type: String = ability.wrappedValue.type.rawValue
                                            let level = ability.wrappedValue.level.description
                                            Text("\(level) \(type)")
                                            .foregroundColor(.red)
                                            .shadow(color: .black, radius: 1)
                                        }
                                    }

                                    Spacer()
                                }
                                .frame(width: self.defaultSize.width * self.scaleFactor, height: self.defaultSize.height * self.scaleFactor)
                            }
                        }

                        HStack
                        {
                            VStack
                            {
                                if let background3 = self.background3
                                {
                                    Text(background3.name)
                                    .foregroundColor(.red)
                                    .shadow(color: .black, radius: 1)

                                    Button(action: self.background3Clicked)
                                    {
                                        CardView(card: background3, scaleFactor: self.scaleFactor)
                                    }
                                    .buttonStyle(.plain)
                                }
                                else
                                {
                                    Text("")

                                    Rectangle().frame(width: self.defaultSize.width * self.scaleFactor, height: self.defaultSize.height * self.scaleFactor)
                                }
                            }
                            .padding(.leading, self.cardPadding / 2)
                            .padding(.trailing, self.cardPadding)

                            VStack
                            {
                                if let background4 = self.background4
                                {
                                    Text(background4.name)
                                    .foregroundColor(.red)
                                    .shadow(color: .black, radius: 1)

                                    Button(action: self.background4Clicked)
                                    {
                                        CardView(card: background4, scaleFactor: self.scaleFactor)
                                    }
                                    .buttonStyle(.plain)
                                }
                                else
                                {
                                    Text("")

                                    Rectangle().frame(width: self.defaultSize.width * self.scaleFactor, height: self.defaultSize.height * self.scaleFactor)
                                }
                            }
                            .padding(.leading, self.cardPadding)
                            .padding(.trailing, self.cardPadding / 2)

                            VStack
                            {
                                Text("Traits")
                                .foregroundColor(.red)
                                .shadow(color: .black, radius: 1)

                                VStack
                                {
                                    if traits.isEmpty
                                    {
                                        Text("None")
                                        .foregroundColor(.red)
                                        .shadow(color: .black, radius: 1)
                                    }
                                    else
                                    {
                                        ForEach($traits, id: \.self)
                                        {
                                            trait in

                                            Text(trait.wrappedValue.description)
                                            .shadow(color: .black, radius: 1)
                                        }
                                    }

                                    Spacer()
                                }
                                .foregroundColor(.red)
                                .frame(width: self.defaultSize.width * self.scaleFactor, height: self.defaultSize.height * self.scaleFactor)
                            }
                        }
                    }
                }
                .foregroundColor(.primary)
                .font(.headline)
            }
        }
        .onAppear(perform: self.initializeBackgrounds)
    }

    var professionsView: some View
    {
        Text("Professions")
    }

    var connectionsView: some View
    {
        Text("Connections")
    }

    public func initialize()
    {
        do
        {
            self.worlds = try KnownWorldsDeck(galaxy: state.galaxy)
        }
        catch
        {
            print("CryogenicsMinigameView error: \(error)")
        }
    }

    public func initializeHomeworlds()
    {
        if let worlds = self.worlds
        {
            self.homeworld1 = try? worlds.draw(turnFaceUp: true)
            self.homeworld2 = try? worlds.draw(turnFaceUp: true)
            self.homeworld3 = try? worlds.draw(turnFaceUp: true)
            self.homeworld4 = try? worlds.draw(turnFaceUp: true)
        }
    }

    public func initializeBackgrounds()
    {
        self.background1 = try? self.backgrounds.draw(turnFaceUp: true)
        self.background2 = try? self.backgrounds.draw(turnFaceUp: true)
        self.background3 = try? self.backgrounds.draw(turnFaceUp: true)
        self.background4 = try? self.backgrounds.draw(turnFaceUp: true)
    }

    public func minigameClicked()
    {
        self.minigameState.subview = .main
    }

    public func homeworldsClicked()
    {
        self.minigameState.subview = .homeworlds
    }

    public func homeworld1Clicked()
    {
        if let homeworld = self.homeworld1
        {
            if let selectedCard = self.state.selectedCard
            {
                if selectedCard == homeworld.identifier
                {
                    self.state.selectedCard = nil
                    abilities = []
                    traits = []
                    return
                }
            }

            self.selectHomeworld(homeworld)
        }
    }

    public func homeworld2Clicked()
    {
        if let homeworld = self.homeworld2
        {
            if let selectedCard = self.state.selectedCard
            {
                if selectedCard == homeworld.identifier
                {
                    self.state.selectedCard = nil
                    abilities = []
                    traits = []
                    return
                }
            }

            self.selectHomeworld(homeworld)
        }
    }

    public func homeworld3Clicked()
    {
        if let homeworld = self.homeworld3
        {
            if let selectedCard = self.state.selectedCard
            {
                if selectedCard == homeworld.identifier
                {
                    self.state.selectedCard = nil
                    abilities = []
                    traits = []
                    return
                }
            }

            self.selectHomeworld(homeworld)
        }
    }

    public func homeworld4Clicked()
    {
        if let homeworld = self.homeworld4
        {
            if let selectedCard = self.state.selectedCard
            {
                if selectedCard == homeworld.identifier
                {
                    self.state.selectedCard = nil
                    abilities = []
                    traits = []
                    return
                }
            }

            self.selectHomeworld(homeworld)
        }
    }

    func selectHomeworld(_ card: Card)
    {
        self.state.selectedCard = card.identifier

        let maybeHomeworld = Homeworld.homeworlds.first
        {
            homeworld in

            homeworld.name == card.name
        }

        if let homeworld = maybeHomeworld
        {
            abilities = homeworld.abilities
            traits = homeworld.traits
        }
        else
        {
            abilities = []
            traits = []
        }
    }

    public func backgroundsClicked()
    {
        self.minigameState.subview = .backgrounds
    }

    public func background1Clicked()
    {
        if let background = self.background1
        {
            if let selectedCard = self.state.selectedCard
            {
                if selectedCard == background.identifier
                {
                    self.state.selectedCard = nil
                    abilities = []
                    traits = []
                    return
                }
            }

            self.selectBackground(background)
        }
    }

    public func background2Clicked()
    {
        if let background = self.background2
        {
            if let selectedCard = self.state.selectedCard
            {
                if selectedCard == background.identifier
                {
                    self.state.selectedCard = nil
                    abilities = []
                    traits = []
                    return
                }
            }

            self.selectBackground(background)
        }
    }

    public func background3Clicked()
    {
        if let background = self.background3
        {
            if let selectedCard = self.state.selectedCard
            {
                if selectedCard == background.identifier
                {
                    self.state.selectedCard = nil
                    abilities = []
                    traits = []
                    return
                }
            }

            self.selectBackground(background)
        }
    }

    public func background4Clicked()
    {
        if let background = self.background4
        {
            if let selectedCard = self.state.selectedCard
            {
                if selectedCard == background.identifier
                {
                    self.state.selectedCard = nil
                    abilities = []
                    traits = []
                    return
                }
            }

            self.selectBackground(background)
        }
    }

    func selectBackground(_ card: Card)
    {
        self.state.selectedCard = card.identifier

        let maybeBackground = Background.backgrounds.first
        {
            background in

            background.name == card.name
        }

        if let background = maybeBackground
        {
            abilities = background.abilities
            traits = background.traits
        }
        else
        {
            abilities = []
            traits = []
        }
    }

    public func professionsClicked()
    {
        self.minigameState.subview = .professions
    }

    public func connectionsClicked()
    {
        self.minigameState.subview = .connections
    }

    public func sceneClicked()
    {
        state.currentView = .scene
    }
}

struct CryogenicsMinigameView_Previews: PreviewProvider
{
    static var previews: some View
    {
        CryogenicsMinigameView()
    }
}

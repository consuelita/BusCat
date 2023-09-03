//
//  CardView.swift
//  BusCat
//
//  Created by Dr. Brandon Wiley on 8/31/23.
//

import SwiftUI

struct CardView: View
{
    @EnvironmentObject var state: GameState
    @State var card: Card
    @State var scaleFactor: CGFloat

    var body: some View
    {
        let image: Image = self.card.getImage()

        if let selectedCard = $state.selectedCard.wrappedValue
        {
            image
            .resizable()
            .scaledToFill()
            .frame(width: card.size.width * self.scaleFactor, height: card.size.height * self.scaleFactor, alignment: .center)
            .clipped()
            .overlay(
                RoundedRectangle(cornerRadius: 2)
                .stroke(selectedCard == card.identifier ? .yellow : .white, lineWidth: 4)
            )
        }
        else
        {
            image
            .resizable()
            .scaledToFill()
            .frame(width: card.size.width * self.scaleFactor, height: card.size.height * self.scaleFactor, alignment: .center)
            .clipped()
            .overlay(
                RoundedRectangle(cornerRadius: 2)
                .stroke(.white, lineWidth: 4)
            )
        }
    }
}

struct CardView_Previews: PreviewProvider
{
    static var previews: some View
    {
        if let nsFront = NSImage(named: NSImage.Name("Space2"))
        {
            let front = Image(nsImage: nsFront)

            if let nsBack = NSImage(named: NSImage.Name("Space2"))
            {
                let back = Image(nsImage: nsBack)

                let uuid = UUID()

                let card = Card(name: "Space", size: .poker, front: front, back: back, identifier: uuid)

                CardView(card: card, scaleFactor: 2)
            }
        }
    }
}

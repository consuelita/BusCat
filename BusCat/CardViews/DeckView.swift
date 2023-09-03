//
//  DeckView.swift
//  BusCat
//
//  Created by Dr. Brandon Wiley on 8/31/23.
//

import SwiftUI

struct DeckView: View
{
    @State var deck: Deck
    @State var scaleFactor: CGFloat

    var body: some View
    {
        if let card = deck.cards.first
        {

            let image: Image = card.getImage()

            image
            .resizable()
            .scaledToFill()
            .frame(width: card.size.width * self.scaleFactor, height: card.size.height * self.scaleFactor, alignment: .center)
            .clipped()
            .overlay(
                RoundedRectangle(cornerRadius: 2)
                .stroke(.foreground, lineWidth: 4)
            )
        }
        else
        {
            Rectangle()
                .fill(.orange)
                .frame(width: $deck.wrappedValue.defaultSize.width * self.scaleFactor, height: $deck.wrappedValue.defaultSize.height * self.scaleFactor)
                .overlay(
                    RoundedRectangle(cornerRadius: 2)
                    .stroke(.foreground, lineWidth: 4)
                )
                .opacity(0.75)
        }
    }
}

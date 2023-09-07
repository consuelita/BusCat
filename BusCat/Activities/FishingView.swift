//
//  FishingView.swift
//  BusCat
//
//  Created by Dr. Brandon Wiley on 8/3/23.
//

import AVKit
import SwiftUI

struct FishingView: View
{
    @EnvironmentObject var state: GameState
    @State var audioPlayer: AVAudioPlayer? = nil
    
    var body: some View
    {
        VStack
        {
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

            HStack
            {
                ZStack
                {
                    VStack
                    {
                        if let image = NSImage(named: NSImage.Name("Fishing"))
                        {
                            Image(nsImage: image)
                        }
                    }
                    .padding()
                }

                VerticalInventoryBar()
                    .padding(.trailing, 5)
            }

            // Inventory
            HorizontalActionBar(actions: ActionCollections.fishingBottom)
                .padding(.bottom, 5)
        }
        .onAppear(perform: self.playSoundtrack)
    }

    public func sceneClicked()
    {
        state.currentView = .scene
    }

    func playSoundtrack()
    {
        if let sound = Bundle.main.path(forResource: "WhiteRiver", ofType: "mp3")
        {
            if let audioPlayer = try? AVAudioPlayer(contentsOf: URL(fileURLWithPath: sound))
            {
                audioPlayer.numberOfLoops = 100
                audioPlayer.play()
                self.audioPlayer = audioPlayer
            }
        }
    }
}

struct FishingView_Previews: PreviewProvider
{
    static var previews: some View
    {
        FishingView()
    }
}

//
//  GalaxyMapView.swift
//  BusCat
//
//  Created by Dr. Brandon Wiley on 7/26/23.
//

import Foundation

import SwiftUI

struct GalaxyMapView: View {
    var body: some View {
        VStack {
            if let image = NSImage(named: NSImage.Name("GalaxyMap2"))
            {
                Image(nsImage: image)
            }
//                .imageScale(.large)
//                .foregroundColor(.accentColor)
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        GalaxyMapView()
    }
}

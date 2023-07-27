//
//  SceneView.swift
//  BusCat
//
//  Created by Dr. Brandon Wiley on 7/26/23.
//

import SwiftUI

struct SceneView: View
{
    var body: some View
    {
        ZStack
        {
            VStack {
                if let image = NSImage(named: NSImage.Name("NatureScene"))
                {
                    Image(nsImage: image)
                }
            }
            .padding()
        }
    }
}

struct SceneView_Previews: PreviewProvider {
    static var previews: some View {
        SceneView()
    }
}

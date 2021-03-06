//
//  TextLink.swift
//  SpotPlayer
//
//  Created by Avi Wadhwa on 2022-05-16.
//

import SwiftUI

struct TextLink: View {
    @State var underline: Bool = false
    var text: String
    var linkUrl: URL
    var body: some View {
        Text(text)
            .underline(underline)
            .onHover { inside in
                underline.toggle()
                /*if inside {
                    NSCursor.pointingHand.push()
                } else {
                    NSCursor.pop()
                }*/
            }
            .lineLimit(1)
            .onTapGesture {
                globalURLOpener(URL: linkUrl)
            }
    }
}

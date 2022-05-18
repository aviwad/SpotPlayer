//
//  FriendRow.swift
//  SpotPlayerFriendActivitytest
//
//  Created by Avi Wadhwa on 2022-04-23.
//

import Foundation
import SwiftUI
import Kingfisher
//import StackNavigationView

struct FriendRow: View {
    var friend: Friend
    @State private var profilePictureHover = false
    var body: some View {
        HStack {
            ZStack (){
                KFImage(URL(string: friend.user.imageURL)!)
                    .placeholder{Image(systemName: "person.fill")}
                    .resizable()
                #if os(iOS)
                    .frame(width: 50, height: 50)
                #endif
                #if os(macOS)
                    .frame(width: 45, height: 45)
                #endif
                    .onHover { hover in withAnimation { self.profilePictureHover = hover }}
                    .overlay(Color.black.opacity(profilePictureHover ? 0.5 : 0))
                    .overlay(self.profilePictureHover ? Image(systemName: "play.fill") : nil)
                    .clipShape(Circle())
                if (friend.humanTimestamp.nowOrNot){
                    Circle()
                        //.stroke(lineWidth: 2)
                        .frame(width: 11, height: 11)
                        .foregroundColor(Color.blue)
                        .offset(x: 16, y: -16)
                }
            }
            .onTapGesture() {
                globalURLOpener(URL: friend.track.url)
            }
            VStack(alignment: .leading, spacing: 3) {
                HStack {
                    TextLink(text: friend.user.name, linkUrl: friend.user.url)
                        .font(.headline)
                    Spacer()
                    Text(friend.humanTimestamp.humanTimestamp)
                        .font(.subheadline)
                }
                HStack (spacing: 2){
                    TextLink(text: friend.track.name, linkUrl: friend.track.url)
                        .font(.subheadline)
                    Image(systemName: "circle.fill")
                        .font(.system(size: 4))
                    TextLink(text: friend.track.artist.name, linkUrl: friend.track.artist.url)
                        .font(.subheadline)
                }
                HStack (spacing: 5){
                    if (friend.track.context.name == friend.track.album.name) {
                        Image(systemName: "record.circle")
                    }
                    else if (friend.track.context.name == friend.track.artist.name) {
                        Image(systemName: "person")
                    }
                    else {
                        Image(systemName: "music.note")
                    }
                    TextLink(text: friend.track.context.name, linkUrl: friend.track.context.url)
                        .font(.subheadline)
                }
            }
            Spacer()
        }
        .contentShape(Rectangle())
        .onDrag(){
            NSItemProvider(object: friend.track.url as NSURL)
        }
        .contextMenu{
            Link(destination: friend.user.url) {
                Label("View Profile", systemImage: "person")
            }
            Link(destination: friend.track.artist.url) {
                Label("View Artist", systemImage: "music.mic.circle")
            }
            Link(destination: friend.track.album.url) {
                Label("View Album", systemImage: "record.circle")
            }
            if (friend.track.context.name != friend.track.artist.name && friend.track.context.name != friend.track.album.name) {
                Link(destination: friend.track.context.url) {
                    Label("View Playlist", systemImage: "music.note")
                }
            }
        }
    }
}

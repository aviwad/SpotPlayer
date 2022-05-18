//
//  FriendList.swift
//  SpotPlayerFriendActivitytest
//
//  Created by Avi Wadhwa on 2022-04-23.
//

import Foundation
import SwiftUI
import WidgetKit
import Introspect

struct FriendRowList: View {
    private let timer = Timer.publish(every: 60, on: .main, in: .common).autoconnect()
    @State var friendArray: [Friend] = []
    func getFriends() async {
        do {
            let data = try await GetFriendActivityBackend.shared.GetFriendActivity()
            withAnimation(){
                friendArray = data
            }
            WidgetCenter.shared.reloadAllTimelines()
        }
        catch {
        }
    }
    var body: some View {
        List {
            ForEach(self.friendArray) { friend in
                    FriendRow(friend: friend)
                //Spacer(minLength: 90)
            }
            Color.clear
                .frame(height: 90)
            //.padding(.bottom, 90)
        }
        #if os(macOS)
        .introspectTableView { tableView in
            tableView.backgroundColor = NSColor.windowBackgroundColor
        }
        #endif
        /*List(self.friendArray) { friend in
                /*.swipeActions(edge: .leading){
                    Button {
                        globalURLOpener(URL: URL(string: "spotify://user/\(friend.user.uri[13...])")!)
                    } label: {
                        Label("View Profile", systemImage: "person")
                    }
                    .tint(Color("AccentColor"))
                }
                .swipeActions(edge: .trailing){
                    Button {
                        globalURLOpener(URL: URL(string: "spotify://album/\(friend.track.album.uri[14...])")!)
                    } label: {
                        Label("View Album", systemImage: "play.circle.fill")
                    }
                    .tint(Color("AccentColor"))
                }*/
        }*/
            .task {
                await getFriends()
            }
            .onReceive(timer) { _ in
                Task {
                    await getFriends()
                }
            }
            #if os(macOS)
            .environment(\.defaultMinListRowHeight, 70)
            #endif
            //.padding(.bottom, 8)
            #if os(iOS)
            .refreshable {
                await getFriends()
            }
            #endif
    }
}

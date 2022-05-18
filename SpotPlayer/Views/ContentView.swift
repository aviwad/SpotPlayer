//
//  ContentView.swift
//  SpotPlayer
//
//  Created by Avi Wadhwa on 2022-04-15.
//

import SwiftUI
import StackNavigationView
struct ContentView: View {

@State private var selection: Int? = 0
@State var showFriends = true
@State private var showPopover: Bool = false
var body: some View {
    ZStack(alignment: .bottom) {
        HStack {
            StackNavigationView(selection: $selection) {
                List {
                    SidebarNavigationLink(destination: rootView(title: "Home"), tag: 0, selection: $selection)  {
                        Label("Home", systemImage: "house")
                            //.font(.system(size: 15))
                    }
                    SidebarNavigationLink(destination: rootView(title: "Search"), tag: 1, selection: $selection)  {
                        Label("Search", systemImage: "magnifyingglass")
                            //.font(.system(size: 15))
                    }
                    SidebarNavigationLink(destination: rootView(title: "My Library"), tag: 2, selection: $selection)  {
                        Label("My Library", systemImage: "folder")
                            //.font(.system(size: 15))
                    }
                }
                .toolbar(){
                    ToolbarItem{
                        Spacer()
                    }
                }
                .frame(minWidth: 250, idealWidth: 250, maxWidth: 250)
                //.listStyle(.sidebar)
                Text("test")
                    .toolbar(){
                        ToolbarItem{
                            Spacer()
                        }
                    }
            }
            Divider()
            FriendRowList()
                .frame(minWidth: 300, idealWidth: 300, maxWidth: 300)
                .toolbar(){
                    ToolbarItem {
                        //Divider()
                    }
                    ToolbarItem {
                        HStack {
                            Button {
                                
                            } label: {
                                Image(systemName: "xmark.icloud")
                                Text("Offline")
                            }
                            .background(Color.accentColor)
                            .foregroundColor(.white)
                            .cornerRadius(6)
                            .disabled(true)
                            /*Button{
                                
                            } label: {
                                Image(systemName: "square.and.arrow.up")
                            }*/
                            Button(action: {self.showPopover = true}, label: {
                                Image(systemName: "person.circle")
                                Text("avi")
                            })
                                .popover(
                                        isPresented: self.$showPopover,
                                        arrowEdge: .bottom
                                    ) { UserPopover() }
                            Divider()
                            Text("**Friend Activity**")
                                .font(.system(size: 14))
                                .padding(.trailing, 187)
                            //Button(action: { }, label: {
                              //  Image(systemName: "sidebar.right")
                            //})
                        }
                    }
                    ToolbarItem {
                    }
                }
        }
        BottomPlayer()
            .frame(height: 90)
    }
    
}
@ViewBuilder private func rootView(title: String) -> some View {
    VStack {
        Text("This is the root view of \(title)")
            .font(.system(size: 50))
            .bold()
        Spacer()
            .frame(height: 40)
        //SidebarNavigationLink("Next", destination: ChildView(sidebar: title, level: 1), tag: 2, selection: $selection)
        StackNavigationLink("Next", destination: ChildView(sidebar: title, level: 1))
    }
    .frame(minWidth: 600, maxWidth: .infinity, maxHeight: .infinity)
    .focusable()
    .padding(20)
    .navigationTitle(title)
}
}

struct ChildView: View {
    
    private var sidebar: String
    private var level: Int
    
    var body: some View {
        VStack {
            Text("This is level \(level) in \(sidebar)")
                .font(.system(size: 50))
                .bold()
            Text("Hit next to proceed to level \(level+1)")
                .font(.system(size: 20))
            Spacer()
                .frame(height: 40)
            StackNavigationLink("Next", destination: ChildView(sidebar: sidebar, level: level+1))
        }
        .padding(20)
        .navigationTitle("Detail \(level)")
    }
    
    init(sidebar: String, level: Int) {
        self.sidebar = sidebar
        self.level = level
    }
    
}


struct RandomAlbumView: View {
    var albumName: String
    var body: some View {
        VStack {
            Text("This is album \(albumName)")
                .font(.system(size: 50))
                .bold()
        }
        .padding(20)
        .navigationTitle("\(albumName)")
    }
}

/*struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
*/


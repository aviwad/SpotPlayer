//
//  BottomPlayer.swift
//  SpotPlayer
//
//  Created by Avi Wadhwa on 2022-05-11.
//

import SwiftUI
//import Introspect

struct BottomPlayer: View {
    var body: some View {
        HStack() {
            BottomPlayerLeft()
                .frame(maxWidth: .infinity, alignment: .leading)
            BottomPlayerCenter()
                .frame(maxWidth: .infinity, alignment: .center)
            BottomPlayerRight()
                .frame(maxWidth: .infinity, alignment: .trailing)
        }
        .padding(.horizontal, 50)
        .frame(maxWidth: .infinity, maxHeight: 90)
        .background(.ultraThinMaterial)
        //.background(.ultraThinMaterial)
        
    }
}

struct BottomPlayerLeft: View {
    var body: some View {
        HStack {
            VStack(alignment: .leading){
                Text("title")
                    .font(.headline)
                Text("subtitle")
                    .font(.subheadline)
            }
            .padding(.trailing, 5)
            Button {
            } label: {
                Image(systemName: "heart")
                    .font(.system(size: 17))
            }
            .buttonStyle(.borderless)
        }
    }
}

struct BottomPlayerCenter: View {
    var body: some View {
        VStack {
            HStack(spacing: 13) {
                Button {
                } label: {
                    Image(systemName: "shuffle")
                }
                .buttonStyle(.borderless)
                Button {
                } label: {
                    Image(systemName: "backward.end.fill")
                }
                .buttonStyle(.borderless)
                Button {
                } label: {
                    Image(systemName: "play.circle.fill")
                        .font(.system(size: 35))
                        .foregroundColor(.white)
                }
                .buttonStyle(.borderless)
                Button {
                } label: {
                    Image(systemName: "forward.end.fill")
                }
                .buttonStyle(.borderless)
                Button {
                } label: {
                    Image(systemName: "repeat")
                }
                .buttonStyle(.borderless)
            }
            .font(.system(size: 21))
            HStack {
                Text("0:03")
                ProgressView(value: 3, total: 100)
                Text("1:40")
            }
        }
    }
}
struct BottomPlayerRight: View {
    @State private var showDevicesPopup: Bool = false
    @State private var showQueuePopup: Bool = false
    var body: some View {
        HStack {
            Button {
                self.showQueuePopup = true
            } label: {
                Image(systemName: "list.bullet.rectangle")
            }
            .buttonStyle(.borderless)
            .popover(
                    isPresented: self.$showQueuePopup,
                    arrowEdge: .bottom
                ) { QueuePopover()}
            Button {
                self.showDevicesPopup = true
            } label: {
                Image(systemName: "hifispeaker")
            }
            .buttonStyle(.borderless)
            .popover(
                    isPresented: self.$showDevicesPopup,
                    arrowEdge: .bottom
                ) { DevicesPopover() }
            Button {
            } label: {
                Image(systemName: "speaker.wave.2")
            }
            .buttonStyle(.borderless)
            ProgressView(value: 3, total: 10)
                .frame(width: 100)
        }
        .font(.system(size: 17))
    }
}

struct BottomPlayer_Previews: PreviewProvider {
    static var previews: some View {
        BottomPlayer()
    }
}

//
//  ReturnSpotifyURL.swift
//  SpotPlayer
//
//  Created by Avi Wadhwa on 2022-05-15.
//

import Foundation

func getSpotifyUrl(initialUrl: String) -> URL {
    var spotifyURL = initialUrl
    let character : Character = "/"
    var index = spotifyURL.index(spotifyURL.startIndex, offsetBy: 8)
    spotifyURL.insert(character, at: index)
    index = spotifyURL.index(spotifyURL.startIndex, offsetBy: 9)
    spotifyURL.insert(character, at: index)
    index = spotifyURL.index(spotifyURL.endIndex, offsetBy: -23)
    spotifyURL.remove(at: index)
    spotifyURL.insert(character, at: index)
    return URL(string: spotifyURL)!
}

// Spotify custom names have different URL length. Needs separate function
func getSpotifyUserUrl(initialUrl: String) -> URL {
    var spotifyURL = initialUrl
    if (spotifyURL.count == 35){
        return getSpotifyUrl(initialUrl: initialUrl)
    }
    let character : Character = "/"
    var index = spotifyURL.index(spotifyURL.startIndex, offsetBy: 8)
    spotifyURL.insert(character, at: index)
    index = spotifyURL.index(spotifyURL.startIndex, offsetBy: 9)
    spotifyURL.insert(character, at: index)
    //index = spotifyURL.index(spotifyURL.endIndex, offsetBy: 23)
    index = spotifyURL.lastIndex(of: ":")!
    spotifyURL.remove(at: index)
    spotifyURL.insert(character, at: index)
    return URL(string: spotifyURL)!
}

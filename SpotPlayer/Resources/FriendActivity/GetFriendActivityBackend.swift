//
//  GetFriendActivityBackend.swift
//  SpotPlayerFriendActivitytest
//
//  Created by Avi Wadhwa on 2022-04-23.
//

import Foundation

final class GetFriendActivityBackend{
    static let shared = GetFriendActivityBackend()
    
     let spDcCookie = "AQCnVnR9ZIblMDWgQGxWO4yaEF9IA12UMxLpsfBskhNA5zKsVaxWqojkJdCaysLEOcorhBMd7nQoEDYppUZ_LVCVlNYjbWHo7sANaPr-TVYXx4SgdWqe3LDOm5oXT3rPk1yEZNELOysuEn5KVOgdNIi5Q455Wb62"
    
    
     func fetch<T: Decodable>(urlString: String, httpValue: String, httpField: String) async throws -> T {
        guard let url = URL(string: urlString) else {
            throw URLError(.badURL)
        }
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue(httpValue, forHTTPHeaderField: httpField)
        let (data, _) = try await URLSession.shared.data(for: request)
        let json = try JSONDecoder().decode(T.self, from: data)
        return json
    }

    
    func GetAccessToken() async throws -> String{
        let accessToken: accessTokenJSON =  try await fetch(urlString: "https://open.spotify.com/get_access_token?reason=transport&productType=web_player", httpValue: "sp_dc=\(spDcCookie)", httpField: "Cookie")
        return accessToken.accessToken
    }
    
    func GetFriendActivity() async throws -> [Friend] {
        let friendArray: Welcome = try await fetch(urlString: "https://guc-spclient.spotify.com/presence-view/v1/buddylist", httpValue: "Bearer \(GetAccessToken())", httpField: "Authorization")
        return friendArray.friends.reversed()
    }
}

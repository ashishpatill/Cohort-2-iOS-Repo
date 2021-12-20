//
//  PhotoModel.swift
//  Movie Api demo
//
//  Created by Ashish Pisey on 20/12/21.
//

import Foundation

struct Photo: Codable {
    let albumId: Int
    let id : Int
    let title: String
    let url: String
    let thumbnailUrl: String
    
//    init?(dict: [String:Any]) {
//        guard let albumId = dict["albumId"] as? Int,  // Important
//              let id = dict["id"] as? Int,
//              let title = dict["title"] as? String,
//              let url = dict["url"] as? String,
//              let thumbnail = dict["thumbnailUrl"] as? String else {
//                  print("parsing failed")
//                  return nil
//              }
//
//        self.albumId = albumId
//        self.id = id
//        self.title = title
//        self.url = url
//        self.thumbnailUrl = thumbnail
//    }
}

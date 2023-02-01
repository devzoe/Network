//
//  Video.swift
//  Network
//
//  Created by 남경민 on 2022/12/24.
//

import Foundation

class VideoService {
    // 싱글톤
    static let shared = VideoService()
    private var videoList: [Video] = []
    // count
    var count: Int { self.videoList.count }
    
    private init() {
        [
            Video(key: "VQRjouwKDlU", title: "새로운 언어를 배워야 하는 네 가지 이유", englishTitle: "4 reasons to learn a new language", imageURL: ""),
            Video(key: "n3kNlFMXslo", title: "자유시간을 지배하는 법", englishTitle: "How to gain control of your free time", imageURL: ""),
            Video(key: "RcGyVTAoXEU", title: "스트레스와 친구가 되는 법", englishTitle: "How to make stress your friend", imageURL: ""),
            Video(key: "ziGD7vQOwl8", title: "다윗과 골리앗의 숨겨진 이야기", englishTitle: "The unheard story of David and Goliath", imageURL: ""),
            Video(key: "c0bsKc4tiuY", title: "우리가 쓸데없는 것을 만들어야 하는 이유", englishTitle: "Why you should make useless things", imageURL: ""),

        ].forEach { video in
            self.videoList.append(video)
        }
    }
    
    public func remove() {
        videoList = []
    }

    
    // Create
    public func add( _ key: String, _ title: String,_ englishTitle: String, _ imageURL:String) {
        self.videoList.append(Video(key: key, title: title, englishTitle: englishTitle,imageURL: imageURL))
    }
    
    // Read
    public func read(at: Int) -> Video {
        return videoList[at]
    }
    public func readAll() -> [Video]{
        return videoList
    }
    
    // Update
    public func update(at: Int, newValue: Video) {
        videoList[at] = newValue
    }
    
    // Delete
    public func delete(at: Int) {
        videoList.remove(at: at)
    }
}


struct Video {
    var key: String
    var title: String
    var englishTitle: String
    var imageURL: String
}

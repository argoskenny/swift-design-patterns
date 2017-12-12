//
//  NewsService.swift
//  design-patterns
//
//  Created by Kenny Lin on 2017/12/12.
//  Copyright © 2017年 Kenny Lin. All rights reserved.
//

import Foundation

struct NewsData {
    var title: String
    var content: String
}

protocol NewsService {
    func loadNewsData()
    func parseNewsData() -> NewsData
}

class SportNews: NewsService {
    
    private var title = ""
    private var content = ""
    
    func loadNewsData() {
        title = "This is sport news"
        content = "Sport news content is here"
    }
    
    func parseNewsData() -> NewsData {
        return NewsData(title: title, content: content)
    }
}

class FashionNews: NewsService {
    
    private var title = ""
    private var content = ""
    
    func loadNewsData() {
        title = "This is fashion news"
        content = "Fashion news content is here"
    }
    
    func parseNewsData() -> NewsData {
        return NewsData(title: title, content: content)
    }
}

class VideoNews: NewsService {
    
    private var videoService: VideoService
    private var title = ""
    private var content = ""
    
    init() {
        videoService = VideoService()
    }
    
    func loadNewsData() {
        videoService.parseTextContent()
        let videoData: [String: String] = videoService.getVideoData()
        if let videoTitle = videoData["title"] {
            title = videoTitle
        }
        if let videoContent = videoData["summary"] {
            content = videoContent
        }
    }
    
    func parseNewsData() -> NewsData {
        return NewsData(title: title, content: content)
    }
}

class VideoService {
    
    private var videoData: [String: String] = [:]
    
    func requestVideo() {
        // other request video code
    }
    
    func parseTextContent() {
        videoData = ["title": "This is video news", "summary" : "Video Summary is here", "clip": "video clip file path"]
    }
    
    func getVideoData() -> [String: String] {
        return videoData
    }
}

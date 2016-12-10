//
//  TwitterAPI.swift
//  ios-charts
//
//  Created by tsuruda_takuya on 2016/12/04.
//  Copyright © 2016年 Takuya Tsuruda. All rights reserved.
//

import Foundation
import TwitterKit

class TwitterAPI {

    class func getTweets(user: String, keyWord: String) -> Int{
        var tweetCount: Int!
        if tweetCount == nil {
            tweetCount = 0
        }
        let params = [
            "q": "\(keyWord)",
            "lang": "ja",
            "count": "100"
            ]
        
        let semaphore:DispatchSemaphore = DispatchSemaphore(value: 0)
        let client = TWTRAPIClient(userID: user)
        var clientError: NSError?
        let endpoint = "https://api.twitter.com/1.1/search/tweets.json"
        let request:NSURLRequest? = client.urlRequest(withMethod: "GET", url: endpoint, parameters: params, error: &clientError) as NSURLRequest?
        if request != nil {
            client.sendTwitterRequest(request! as URLRequest, completion: {
                response, data, err in
                if err == nil {
                    var jsonError: NSError?
                    let json = try! JSONSerialization.jsonObject(with: data!, options: .allowFragments) as! [String:AnyObject]
                    
                    let tweets = TWTRTweet.tweets(withJSONArray: json["statuses"] as! [Any]?)
                    print("@@@@@@@")
                    print(tweets)
                    tweetCount = tweets.count
                }else{
                    print("request error: \(err)")
                }
                semaphore.signal()
            })
        }
        print("wait")
        semaphore.wait()
        
        print("return value")
        print(tweetCount)
        return tweetCount
    }
}


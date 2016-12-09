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
        var tweetCount: Int! = 0
        let params = [
            "q": "\(keyWord)",
            "lang": "ja",
            "from": "@K_blooossom"
            ]
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
                    let metaData = json["search_metadata"]
                    tweetCount = metaData?["count"]! as! Int
                    print("in if value")
                    print(tweetCount)
//                    if let jsonArray = json as? NSArray {
//                        tweets(TWTRTweet.tweets(withJSONArray: jsonArray as! [Any]) as! [TWTRTweet])
//                    }else{
//                        error(err as! NSError)
//                    }
                }else{
                    print("request error: \(err)")
                }
            })
        }
        print("return value")
        print(tweetCount)
        return tweetCount
    }
}


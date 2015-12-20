//: Playground - noun: a place where people can play
import SwiftyJSON
import XCPlayground
import UIKit

let url = NSURL(string: "https://ja.wikipedia.org/w/api.php?format=json&action=query&prop=categories&titles=swift")
var request = NSURLRequest(URL: url!)
NSURLConnection.sendAsynchronousRequest(request, queue: NSOperationQueue.mainQueue()) { (response, data, error) -> Void in
    
    guard let data = data else { return; }
    
    // SwiftyJSON を使わない場合
    do {
        let json = try NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableContainers)
        if let query = json["query"] as? NSDictionary {
            if let normalized = query["normalized"] as? NSArray {
                if let firstNormarized = normalized[0] as? NSDictionary {
                    if let to = firstNormarized["to"] as? String {
                        to
                    }
                }
            }
        }
    } catch let jsonError as NSError {}
    
    // SwiftyJSON を使った場合
    let json = JSON(data:data)
    if let normarizedKeyword = json["query"]["normalized"][0]["to"].string {
        normarizedKeyword
    }
    
    if let normarizedKeyword_ = json["query", "normalized", 0, "to"].string {
        normarizedKeyword_
    }
}

// ここ外すと通信が実行されます
//XCPSetExecutionShouldContinueIndefinitely()

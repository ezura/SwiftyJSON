//: Playground - noun: a place where people can play
import SwiftyJSON
import XCPlayground
import UIKit

let url = NSURL(string: "https://ja.wikipedia.org/w/api.php?format=json&action=query&prop=categories&titles=swift")
var request = NSURLRequest(URL: url!)
NSURLConnection.sendAsynchronousRequest(request, queue: NSOperationQueue.mainQueue()) { (response, data, error) -> Void in
    let json = JSON(data:data!)
    let json_ = JSON(data!)
    try! String(contentsOfURL: url!, encoding: NSUTF8StringEncoding)
    if let title = json["query"]["pages"]["927971"]["title"].string {
        title
    }
    
    if let pageid = json["query"]["pages"]["927971"]["pageid"].int {
        pageid
    }
}

XCPSetExecutionShouldContinueIndefinitely()

func open (path: String, utf8: NSStringEncoding = NSUTF8StringEncoding) -> String? {
    do {
        let contents = try String(contentsOfFile: path, encoding: utf8)
        return contents;
    }
    catch {
        return nil
    }
}

//func calc (nums :[Int]) -> Int {
//    var sum = 0
//    for (var i = 0; i < nums.count; i++) {
//        let num = nums[i]
//        
//        for (var j = 0; j < i; j++) {
//            if (num < nums[j]) {
//                sum++
//            }
//        }
//    }
//    return sum
//}
//
//
//"/Users/tf_member/workspace/private/swift/SwiftyJSON/Example/Playground.playground/Resources/SwiftyJSONTests.json"
//let bundle = NSBundle.mainBundle()
//let path = NSBundle.mainBundle().pathForResource("crossing", ofType: "txt")
//let contents = try! String(contentsOfFile: path!, encoding: NSUTF8StringEncoding)
//
//if let loadedData = open(path!) {
//    let qs = loadedData.componentsSeparatedByString("\r\n").map { $0.componentsSeparatedByString("")
//        
//        .map { Int($0)! } }
//    qs.map { calc($0) }
//    
//} else {
//    print("error reading file")
//}
//
////
////let image = UIImage(named: "2020337")








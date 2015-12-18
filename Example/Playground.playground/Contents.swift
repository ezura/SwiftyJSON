//: Playground - noun: a place where people can play
import SwiftyJSON
import XCPlayground
import UIKit

let url = NSURL(string: "https://ja.wikipedia.org/w/api.php?format=json&action=query&prop=categories&titles=swift")
var request = NSURLRequest(URL: url!)
NSURLConnection.sendAsynchronousRequest(request, queue: NSOperationQueue.mainQueue()) { (response, data, error) -> Void in
    
    guard let data = data else { return; }
    
    // SwiftyJSON 使わない場合
    do {
        let json: AnyObject = try NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableContainers)
        if let query = json["query"] as? NSDictionary {
            if let normalized = query["normalized"] as? NSArray {
                if let firstNormarized = normalized[0] as? NSDictionary {
                    if let to = firstNormarized["to"] as? String {
                        to
                    }
                }
            }
        }
    } catch let aError as NSError {}
    
    // SwiftyJSON 使った場合
    let json = JSON(data:data)
    if let normarizedKeyword = json["query"]["normalized"][0]["to"].string {
        normarizedKeyword
    }
    
    if let title = json["query"]["pages"]["927971"]["title"].string {
        title
    }
    
    if let pageid = json["query"]["pages"]["927971"]["pageid"].int {
        pageid
    }
}


XCPSetExecutionShouldContinueIndefinitely()

//func open (path: String, utf8: NSStringEncoding = NSUTF8StringEncoding) -> String? {
//    do {
//        let contents = try String(contentsOfFile: path, encoding: utf8)
//        return contents;
//    }
//    catch {
//        return nil
//    }
//}
//
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
//
//
//private let trueNumber = NSNumber(bool: true)
//private let falseNumber = NSNumber(bool: false)
//private let trueObjCType = String.fromCString(trueNumber.objCType)
//private let falseObjCType = String.fromCString(falseNumber.objCType)
//trueNumber.objCType
//trueNumber.dynamicType
//
//let a = NSNumber(booleanLiteral: true)
//let b = NSNumber(bool: true)
//b.type
//var a: JSON = true
//a       // => "aaa"
//a.dynamicType  // SwiftyJSON.JSON.Type
//
//class NormalClass { var a = "aaa"}
//
//class DescriptionSample: Swift.Printable, Swift.DebugPrintable {
//    var m = "sample"
//    var description: String {
//        return "\(m) description"
//    }
//    var debugDescription: String {
//        return "\(m) debugDescription"
//    }
//}
//
//let a = NormalClass()
//print("print", a)
//debugPrint("debugPrint", a)
//"\(a)"
//
//let b = DescriptionSample()
//print(b)
//debugPrint(b)
//"\(b)"
//
//enum SampleEnum: Swift.Printable {
//    case a, b
//    var description: String {
//    return " description"
//    }
//    var debugDescription: String {
//        return "\(m) debugDescription"
//    }
//}

struct SampleStruct {}

extension SampleStruct : SequenceType {
    typealias Generator = SampleGenerator
    func generate() -> Generator {
        return Generator()
    }
}

struct SampleGenerator : GeneratorType {
    typealias Element = Int
    
    var index = 0
    mutating func next() -> Element? {
        index++
        if (index > 10) { return nil }
        return Int(arc4random())
    }
}

let sampleStruct = SampleStruct()
sampleStruct.map { $0 }
sampleStruct.maxElement()
sampleStruct.reduce(0, combine: { $0 + $1 } )


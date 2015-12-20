////: Playground - noun: a place where people can play
//import SwiftyJSON
//import XCPlayground
//import UIKit
//
//let url = NSURL(string: "https://ja.wikipedia.org/w/api.php?format=json&action=query&prop=categories&titles=swift")
//var request = NSURLRequest(URL: url!)
//NSURLConnection.sendAsynchronousRequest(request, queue: NSOperationQueue.mainQueue()) { (response, data, error) -> Void in
//    
//    guard let data = data else { return; }
//    
//    // SwiftyJSON を使わない場合
//    do {
//        let json = try NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableContainers)
//        if let query = json["query"] as? NSDictionary {
//            if let normalized = query["normalized"] as? NSArray {
//                if let firstNormarized = normalized[0] as? NSDictionary {
//                    if let to = firstNormarized["to"] as? String {
//                        to
//                    }
//                }
//            }
//        }
//    } catch let jsonError as NSError {}
//    
//    // SwiftyJSON を使った場合
//    let json = JSON(data:data)
//    if let normarizedKeyword = json["query"]["normalized"][0]["to"].string {
//        normarizedKeyword
//    }
//    
//    if let normarizedKeyword_ = json["query", "normalized", 0, "to"].string {
//        normarizedKeyword_
//    }
//}
//
//
////XCPSetExecutionShouldContinueIndefinitely()
//
//
////"/Users/tf_member/workspace/private/swift/SwiftyJSON/Example/Playground.playground/Resources/SwiftyJSONTests.json"
////let bundle = NSBundle.mainBundle()
////let path = NSBundle.mainBundle().pathForResource("crossing", ofType: "txt")
////let contents = try! String(contentsOfFile: path!, encoding: NSUTF8StringEncoding)
////
////if let loadedData = open(path!) {
////    let qs = loadedData.componentsSeparatedByString("\r\n").map { $0.componentsSeparatedByString("")
////        
////        .map { Int($0)! } }
////    qs.map { calc($0) }
////    
////} else {
////    print("error reading file")
////}
////
//////
//////let image = UIImage(named: "2020337")
////
////
////private let trueNumber = NSNumber(bool: true)
////private let falseNumber = NSNumber(bool: false)
////private let trueObjCType = String.fromCString(trueNumber.objCType)
////private let falseObjCType = String.fromCString(falseNumber.objCType)
////trueNumber.objCType
////trueNumber.dynamicType
////
////let a = NSNumber(booleanLiteral: true)
////let b = NSNumber(bool: true)
////b.type
////var a: JSON = true
////a       // => "aaa"
////a.dynamicType  // SwiftyJSON.JSON.Type
////
////class NormalClass { var a = "aaa"}
////
////class DescriptionSample: Swift.Printable, Swift.DebugPrintable {
////    var m = "sample"
////    var description: String {
////        return "\(m) description"
////    }
////    var debugDescription: String {
////        return "\(m) debugDescription"
////    }
////}
////
////let a = NormalClass()
////print("print", a)
////debugPrint("debugPrint", a)
////"\(a)"
////
////let b = DescriptionSample()
////print(b)
////debugPrint(b)
////"\(b)"
////
////enum SampleEnum: Swift.Printable {
////    case a, b
////    var description: String {
////    return " description"
////    }
////    var debugDescription: String {
////        return "\(m) debugDescription"
////    }
////}
//
//struct SampleStruct {
//    var object:AnyObject?
//}
//
//// [] を実装
//extension SampleStruct {
//    subscript(key: String) -> SampleStruct {
//        get {
//            return self
//        }
//        set {
//            object = key
//        }
//    }
//    
//    subscript(path: AnyObject...) -> SampleStruct {
//        for element in path { print(element) }
//        return self
//    }
//    // 上はこう書いた時と同じです
////    subscript(path: AnyObject...) -> SampleStruct {
////        get {
////            for element in path { print(element) }
////            return self
////        }
////    }
//}
//
//extension SampleStruct : SequenceType {
//    // イテレータのようなもの
//    typealias Generator = SampleGenerator
//    func generate() -> Generator {
//        return Generator()
//    }
//}
//
//struct SampleGenerator : GeneratorType {
//    typealias Element = Int
//    
//    var index = 0
//    mutating func next() -> Element? {
//        // 次がない場合は nil を返します
//        if (index > 10) { return nil }
//        return index++
////        index++
////        return Int(arc4random())
//    }
//}
//
//extension SampleStruct : CollectionType {
//    typealias Index = Int
//    var startIndex: Index { return 0 }
//    var endIndex: Index { return 10 }
//    
//    subscript (position: Index) -> Generator.Element {
//        return position
//    }
//}
//
//extension SampleStruct : BooleanType {
//    var boolValue:Bool { return true }
//}
//
//let array = [1, 2, 3]
//array.map({ $0 })
//for var element in array {}
//
//let sampleStruct = SampleStruct()
//
//sampleStruct["sample"]
//sampleStruct[1, 2, 3, "a"]
//
//sampleStruct.map({ $0 })
//for element in sampleStruct { print(element) }
//
//sampleStruct.first
//
//if (sampleStruct) {}
//while (!sampleStruct) {}
//
//
////sampleStruct.map { $0 }
////sampleStruct.maxElement()
////sampleStruct.reduce(0, combine: { $0 + $1 } )
//
//let jsonStr:JSON = "aaa"
//let jsonBool:JSON = true
//let json = JSON(["sample": [1, "a", true], "str": "abc"])
//json["sample"]
//for element in json { print(element) }
//json.map({ $0 })
//json.first
//
//json.description
//
//for element in jsonBool { print("aaa") }
//
//

struct SampleStruct {
    var object:Any?
}

// ここに実装を追加していきます
// [] を実装
extension SampleStruct {
    subscript(key: String) -> SampleStruct {
        get {
            return self
        }
        set {
            object = key
        }
    }
}

let sampleStruct = SampleStruct()

// 以下は今の状態では全てエラーです
sampleStruct["sample"]
sampleStruct["sample"]["sample"]

sampleStruct.map({ $0 })
for element in sampleStruct { print(element) }

sampleStruct.first

if (sampleStruct) {}
while (!sampleStruct) {}
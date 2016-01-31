//: [Previous](@previous)

import Foundation

/*
Exercise Questions
https://docs.google.com/document/d/1Vk3s7uVcePba7mYUWl0o0s8jdGNwPWPHVBXprTpc6bk/edit#
*/

/*
1) For each of these hash functions, say whether they are good, bad, or invalid. Justify your answer. Supply an example of a collision if you can.
*/

func hash1(s: String) -> Int {
    // Character code of first letter
    return Int(s.unicodeScalars.first!.value)
}
// a) Good


func hash2<T>(obj: T) -> Int {
    return 123
}
// b) Bad because it's always going to return the same result


func hash4(s: String) -> Int {
    // Sum of all character codes in s
    return Int(s.unicodeScalars
        .map{$0.value}
        .reduce(0, combine: {$0 + $1}))
}
// c) it's bad, because same words with different arrangement will cause a collision.


func hash3(s: String) -> Int {
    return Int(s.unicodeScalars
        .map{$0.value}
        .reduce(0, combine: {$0 + 256 * $1}))
}
// d)


//func hash4(p: Person) -> Int {
//    return p.age
//}
// e) bad, because two people can have the same age


//func hash5(date: NSDate) -> Int {
//    return date.timeIntervalSinceNow
//}
// f) invalid, because same input will generate differnt output

/*
2) Use our set implementation from in class to write a simple spellCheck function that returns true if the string has no spelling errors. Use a dictionary of 6 words, and test your method both with a string that passes and a string that fails
*/

protocol SetProtocol {
    typealias ItemType
    mutating func add(item: ItemType)
    mutating func remove(item: ItemType)
    func contains(item: ItemType) -> Bool
}

func hash(x: String) -> Int {
    return Int(x.unicodeScalars.first!.value)
}

struct StringHashSet: SetProtocol, CustomStringConvertible {
    private var elements = [String?](count: 128, repeatedValue: nil)
    // SetProtocol
    typealias ItemType = String
    mutating func add(item: String) {
        elements[hash(item)] = item
    }
    mutating func remove(item: String) {
        elements[hash(item)] = nil
    }
    func contains(item: String) -> Bool {
        return elements[hash(item)] == item
    }
    // CustomStringConvertible
    var description: String {
        return "{\(elements.filter{$0 != nil}.map{$0!})}"
    }
}

var spellDict = StringHashSet()

for word in ["the", "quick", "brown", "fox", "jumps", "over"] {
    spellDict.add(word)
}

spellDict

func spellCheck(str: String) -> Bool {
    for word in str.componentsSeparatedByString(" ") {
        if !spellDict.contains(word) {
            return false
        }
    }
    return true
}

spellCheck("the quick brown fox jumps over fox brown jumps quick")
spellCheck("the quick brwon fox jumps over fox brown jumps quick")

/*
var spellDict = Set<String>()

for word in ["the", "quick", "brown", "fox", "jumps", "over", "truck"] {
    spellDict.insert(word)
}

spellDict

func spellCheck(str: String) -> Bool {
    for word in str.componentsSeparatedByString(" ") {
        if !spellDict.contains(word) {
            return false
        }
    }
    return true
}

spellCheck("the quick brown truck jumps over fox brown jumps quick")
spellCheck("the quick brwon truck jumps over fox brown jumps quick")
*/

//: [Next](@next)

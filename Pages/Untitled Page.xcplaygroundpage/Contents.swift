//: [Previous](@previous)

import Foundation

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
    private var elements: [String?]
    
    init(capacity: Int) {
        elements = [String?](count: capacity, repeatedValue: nil)
    }
    
    // SetProtocol
    typealias ItemType = String
    mutating func add(item: String) {
        let hashValue = hash(item)
        if (contains(item)) { return }
        for i in 0..<elements.count {
            if (elements[(hashValue + i) % elements.count] == nil) {
                elements[(hashValue + i) % elements.count] = item
                return
            }
        }
        print("Out of room!")
    }
    mutating func remove(item: String) {
        
    }
    func contains(item: String) -> Bool {
        let hashValue = hash(item)
        for i in 0..<elements.count {
            if let element = elements[(hashValue + i) % elements.count] {
                if (element == item) {
                    return true
                }
            } else {
                return false
            }
        }
        return false
    }
    // CustomStringConvertible
    var description: String {
        return "{\(elements.filter{$0 != nil}.map{$0!})}"
        //return "{\(elements)}"
    }
}

var genres = StringHashSet(capacity: 16)

genres.add("Pop")
genres.add("Pop")
genres.add("Rock")
genres.add("R&B")
genres.add("Funk")

genres.contains("Rock")
genres.contains("Western")

genres.remove("Pop")
genres.contains("Pop")

//: [Next](@next)

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
    var elements = [String?](count: 128, repeatedValue: nil)
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
        return "{\(genres.elements.filter{$0 != nil}.map{$0!})}"
    }
}

var genres = StringHashSet()

genres.add("Pop")
genres.add("Pop")
genres.add("Rock")
genres.add("Funk")

genres.contains("Rock")
genres.contains("Western")

genres.remove("Pop")
genres.contains("Pop")

genres.add("R&B") // Uh-oh



//: [Next](@next)

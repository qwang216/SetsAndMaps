//: Playground - noun: a place where people can play

import UIKit


protocol SetProtocol {
    typealias ItemType
    mutating func add(item: ItemType)
    mutating func remove(item: ItemType)
    func contains(item: ItemType) -> Bool
}

struct ArraySet<T: Equatable>: SetProtocol, CustomStringConvertible {
    var elements = [T]()
    // SetProtocol
    typealias ItemType = T
    mutating func add(item: T) {
        if !contains(item) {
            elements.append(item)
        }
    }
    mutating func remove(item: T) {
        if let idx = elements.indexOf(item) {
            elements.removeAtIndex(idx)
        }
    }
    func contains(item: T) -> Bool {
        for element in elements {
            if element == item {
                return true
            }
        }
        return false
    }
    // CustomStringConvertible
    var description: String {
        return "{\(elements)}"
    }
}

var colors = ArraySet<String>()
colors.add("blue")
colors.contains("blue")
colors.contains("red")
colors.add("green")
colors.add("orange")

colors.remove("blue")
colors.contains("blue")

colors.add("brown")
colors.add("brown")
colors.remove("brown")
colors.remove("not present")

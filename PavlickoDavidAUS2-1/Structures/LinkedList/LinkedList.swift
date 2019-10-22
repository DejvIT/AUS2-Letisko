//
//  LinkedList.swift
//  PavlickoDavidAUS2-1
//
//  Created by MaestroDavo on 19/10/2019.
//  Copyright © 2019 David Pavlicko. All rights reserved.
//

import Foundation

public struct LinkedList<T>: CustomStringConvertible {
    
    private var head: LinkedListNode<T>?
    private var tail: LinkedListNode<T>?

    public init() { }

    public var isEmpty: Bool {
        return head == nil
    }

    public var first: LinkedListNode<T>? {
        return head
    }

    public mutating func append(_ value: T) {
        
        let newNode = LinkedListNode(value: value)
        
        if let tailNode = tail {
            newNode.previous = tailNode
            tailNode.next = newNode
        } else {
            head = newNode
        }
        
        tail = newNode
    }

    public mutating func remove(_ node: LinkedListNode<T>) -> T {
        
        let prev = node.previous
        let next = node.next

        if let prev = prev {
            prev.next = next
        } else {
            head = next
        }
        
        next?.previous = prev

        if next == nil {
            tail = prev
        }

        node.previous = nil
        node.next = nil

        return node.value
    }

    public var description: String {
        
        var text = "["
        var node = head

        while node != nil {
            
          text += "\(node!.value)"
          node = node!.next
          if node != nil { text += ", " }
            
        }
        
        return text + "]"
    }
}

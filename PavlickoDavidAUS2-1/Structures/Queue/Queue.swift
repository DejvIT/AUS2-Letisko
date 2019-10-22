//
//  Queue.swift
//  PavlickoDavidAUS2-1
//
//  Created by MaestroDavo on 19/10/2019.
//  Copyright © 2019 David Pavlicko. All rights reserved.
//

import Foundation

public struct Queue<T> {

    fileprivate var list = LinkedList<T>()
    private var _count: Int = 0
    
    
    public func count() -> Int {
        return self._count
    }
    
    public var isEmpty: Bool {
        return list.isEmpty
    }
  
    public mutating func enqueue(_ element: T) {
        list.append(element)
        self._count += 1
    }

    public mutating func dequeue() -> T? {
        
        guard !list.isEmpty, let element = list.first else { return nil }

        _ = list.remove(element)
        self._count -= 1

        return element.value
    }

    public func peek() -> T? {
        return list.first?.value
    }
}

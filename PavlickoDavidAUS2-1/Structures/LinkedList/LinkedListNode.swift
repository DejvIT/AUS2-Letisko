//
//  LinkedListNode.swift
//  PavlickoDavidAUS2-1
//
//  Created by MaestroDavo on 19/10/2019.
//  Copyright © 2019 David Pavlicko. All rights reserved.
//

import Foundation

public class LinkedListNode<T> {
    
    public var value: T
    public var next: LinkedListNode<T>?
    public var previous: LinkedListNode<T>?

    public init(value: T) {
        self.value = value
    }
}

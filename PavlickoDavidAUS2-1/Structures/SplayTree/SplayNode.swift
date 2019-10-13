//
//  SplayNode.swift
//  PavlickoDavidAUS2-1
//
//  Created by MaestroDavo on 13/10/2019.
//  Copyright © 2019 David Pavlicko. All rights reserved.
//

import Foundation

public class SplayNode<T> {
    
    var _value: T
    var _leftChild: SplayNode<T>?
    var _rightChild: SplayNode<T>?
    var _parent: SplayNode<T>?

    init(_ value: T) {
        self._value = value
    }
    
    deinit {
        print("Splay node is being deallocated.")
    }
    
    var value: T {
        get {
            return self._value
        }
    }
    
    var left: SplayNode<T>? {
        get {
            return self._leftChild
        }
    }
    
    var right: SplayNode<T>? {
        get {
            return self._rightChild
        }
    }
    
    var parent: SplayNode<T>? {
        get {
            return self._parent
        }
    }
}

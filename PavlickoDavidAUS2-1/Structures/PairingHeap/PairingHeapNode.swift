//
//  PairingHeapNode.swift
//  PavlickoDavidAUS2-1
//
//  Created by MaestroDavo on 20/10/2019.
//  Copyright © 2019 David Pavlicko. All rights reserved.
//

import Foundation

public class PairingHeapNode<T> {
    
    var _value: T
    var _leftChild: PairingHeapNode<T>?
    var _rightChild: PairingHeapNode<T>?
    var _parent: PairingHeapNode<T>?

    init(_ value: T) {
        self._value = value
    }
    
    deinit {
        print("Pairing heap node is being deallocated.")
    }
    
    var value: T {
        get {
            return self._value
        }
    }
    
    var left: PairingHeapNode<T>? {
        get {
            return self._leftChild
        }
    }
    
    var right: PairingHeapNode<T>? {
        get {
            return self._rightChild
        }
    }
    
    var parent: PairingHeapNode<T>? {
        get {
            return self._parent
        }
    }
    
}

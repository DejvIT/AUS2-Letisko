//
//  PairingHeapNode.swift
//  PavlickoDavidAUS2-1
//
//  Created by MaestroDavo on 20/10/2019.
//  Copyright © 2019 David Pavlicko. All rights reserved.
//

import Foundation

public class PairingHeapNode<T, K> {
    
    var _value: T
    var _leftChild: PairingHeapNode<T, K>?
    var _rightChild: PairingHeapNode<T, K>?
    var _parent: PairingHeapNode<T, K>?
    var _key: K

    init(_ value: T,_ key: K) {
        self._value = value
        self._key = key
    }
    
    deinit {
        print("Pairing heap node is being deallocated.")
    }
    
    var value: T {
        get {
            return self._value
        }
    }
    
    var key: K {
        get {
            return self._key
        }
    }
    
    var left: PairingHeapNode<T, K>? {
        get {
            return self._leftChild
        }
    }
    
    var right: PairingHeapNode<T, K>? {
        get {
            return self._rightChild
        }
    }
    
    var parent: PairingHeapNode<T, K>? {
        get {
            return self._parent
        }
    }
    
}

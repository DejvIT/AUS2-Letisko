//
//  PairingHeap.swift
//  PavlickoDavidAUS2-1
//
//  Created by MaestroDavo on 20/10/2019.
//  Copyright © 2019 David Pavlicko. All rights reserved.
//

import Foundation

public class PairingHeap<T> {

    private let comparator: Comparator
    public private(set)var _root: PairingHeapNode<T>?
    private var _count: Int = 0
  
    public init(_ comparator: @escaping Comparator) {
        self.comparator = comparator
    }
  
    deinit {
        print("Pairing heap is being deallocated.")
    }
  
    public func getCount() -> Int {
        return self._count
    }
  
    public func getRoot() -> PairingHeapNode<T>? {
        return self._root
    }
    
    public func empty() -> Bool {
        
        return self._root == nil ? true : false
    }
    
    //MARK: - Insert
    public func insert(_ newItem: T, key: T) -> Bool {
        
        guard let root = self._root else {
            self._root = PairingHeapNode(newItem, key)
            _count += 1
            return true
        }
        
        if (comparator(newItem, root.value) == .orderedDescending) {
            
            let oldLeftChild = self._root?.left
            self._root?._leftChild = PairingHeapNode(newItem, key)
            self._root?.left?._parent = self._root
            self._root?.left?._rightChild = oldLeftChild
            oldLeftChild?._parent = self._root?.left
            
        } else {
            
            let oldRoot = root
            self._root = PairingHeapNode(newItem, key)
            self._root?._leftChild = oldRoot
            oldRoot._parent = self.getRoot()
        }

        _count += 1
        return true
    }
    
    //MARK: - Merge
    public func merge(_ nodeA: PairingHeapNode<T>, nodeB: PairingHeapNode<T>) -> PairingHeapNode<T>? {
        
        if (comparator(nodeA.value, nodeB.value) == .orderedAscending) {
            nodeA._leftChild = nodeB
            nodeB._parent = nodeA
            return nodeA
        } else {
            nodeB._rightChild = nodeA.left
            nodeA._leftChild = nodeB
            return nodeB
        }
        
    }
    
    public func twoPassMerge(_ node: PairingHeapNode<T>) {
        
    }
    
    public func delete(_ node: PairingHeapNode<T>) {
        
    }
}

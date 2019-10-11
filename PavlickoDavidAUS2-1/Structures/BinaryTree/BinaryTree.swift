//
//  Tree.swift
//  PavlickoDavidAUS2-1
//
//  Created by MaestroDavo on 11/10/2019.
//  Copyright © 2019 David Pavlicko. All rights reserved.
//

import Foundation

public class BinaryTree<T> {
  
    private let comparator: Comparator
    public private(set)var _root: BinaryNode<T>?
    private var _count: Int = 0
    
    public init(_ comparator: @escaping Comparator) {
        self.comparator = comparator
    }
    
    public func getCount() -> Int {
        return self._count
    }
    
    public func getRoot() -> BinaryNode<T>? {
        return self._root
    }
    
    public func insert(_ newItem: T) -> Bool {
        
        guard let root = self._root else {
            self._root = BinaryNode(newItem)
            _count += 1
            return true
        }
        
        var pivot = root
        var deep = 1
        
        while true {
            
            deep += 1
            switch (comparator(newItem, pivot.value)) {
            case .orderedSame:
                return false
            case .orderedAscending:
                if (pivot.left == nil) {
                    pivot._leftChild = BinaryNode(newItem)
                    pivot._leftChild?._parrent = pivot
                    _count += 1
                    pivot._leftChild?._h = deep
                    return true
                } else {
                    pivot = pivot.left!
                }
            case .orderedDescending:
                if (pivot.right == nil) {
                    pivot._rightChild = BinaryNode(newItem)
                    pivot._rightChild?._parrent = pivot
                    _count += 1
                    pivot._rightChild?._h = deep
                    return true
                } else {
                    pivot = pivot.right!
                }
            default:
                return false
            }
        }
    }
    
    public func levelOrder() -> [T] {
           
        var result: [T] = []
        var discoveredNodes: [BinaryNode<T>] = [self._root!]
       
        while discoveredNodes.count > 0 {
           
            for item in discoveredNodes {

                let pivot = discoveredNodes[0]
                result.append(pivot.value)
               
                if (item.left != nil) {
                    discoveredNodes.append(item.left!)
                }
               
                if (item.right != nil) {
                    discoveredNodes.append(item.right!)
                }
               
                discoveredNodes.remove(at: 0)
            }
        }
           
        return result
    }
    
    public func search(_ item: T) -> T? {
        
        guard var pivot = self._root else {
            return nil
        }
        
        while true {
            
            switch (comparator(item, pivot.value)) {
            case .orderedSame:
                return pivot.value
            case .orderedAscending:
                if (pivot.left == nil) {
                    return nil
                } else {
                    pivot = pivot.left!
                }
            case .orderedDescending:
                if (pivot.right == nil) {
                    return nil
                } else {
                    pivot = pivot.left!
                }
            default:
                return nil
            }
        }
    }
    
}

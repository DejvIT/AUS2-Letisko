//
//  PairingHeap.swift
//  PavlickoDavidAUS2-1
//
//  Created by MaestroDavo on 20/10/2019.
//  Copyright © 2019 David Pavlicko. All rights reserved.
//

import Foundation

public class PairingHeap<T, K> {

    private let comparator: Comparator
    public private(set)var _root: PairingHeapNode<T, K>?
    private var _count: Int = 0
  
    public init(_ comparator: @escaping Comparator) {
        self.comparator = comparator
    }
    
    public init(root: PairingHeapNode<T, K>, comparator: @escaping Comparator) {
        self._root = root
        self.comparator = comparator
        self._count = 1
    }
  
    deinit {
//        print("Pairing heap with root \(String(describing: self.getRoot()?.value)) is being deallocated.")
    }
  
    public func getCount() -> Int {
        return self._count
    }
  
    public func getRoot() -> PairingHeapNode<T, K>? {
        return self._root
    }
    
    public func empty() -> Bool {
        
        return self._root == nil ? true : false
    }
    
    //MARK: - Insert
    public func insert(_ newItem: T, key: K) -> PairingHeapNode<T, K> {
        
        let newNode = PairingHeapNode(newItem, key)
        
        guard let root = self._root else {
            self._root = newNode
            _count += 1
            return newNode
        }

        _ = merge(root, newNode)
        _count += 1
        return newNode
    }
    
    //MARK: - Merge
    public func merge(_ nodeA: PairingHeapNode<T, K>,_ nodeB: PairingHeapNode<T, K>) -> PairingHeapNode<T, K>? {
        
        if (comparator(nodeA.value, nodeB.value) == .orderedAscending || comparator(nodeA.value, nodeB.value) == .orderedSame) {
            
            let oldLeftA = nodeA.left
            nodeA._leftChild = nodeB
            nodeB._parent = nodeA
            nodeB._rightChild = oldLeftA
            nodeB.right?._parent = nodeB
            
            return nodeA
            
        } else {

            if (nodeA.parent == nil) {
                
                let oldRoot = self.getRoot()
                self._root = nodeB
                oldRoot?._rightChild = self._root?.left
                self._root?.left?._parent = oldRoot
                self._root!._leftChild = oldRoot
                oldRoot?._parent = self._root
                
            } else {

                let oldLeftB = nodeB.left
                nodeB._leftChild = nodeA
                nodeA._parent = nodeB
                nodeB._parent = nodeA.parent
                nodeA._rightChild = oldLeftB
                nodeA.right?._parent = nodeA
            }
            
            
            return nodeB
        }
        
    }
    
    //MARK: - Merge Trees
    public func mergeTrees(_ heapA: PairingHeap<T, K>,_ heapB: PairingHeap<T, K>) -> PairingHeap<T, K>? {
        
        _ = merge(heapA.getRoot()!, heapB.getRoot()!)
        heapA._count += heapB.getCount()
        return heapA
    }
    
    //MARK: - Delete
    public func delete() {
        
        if (self.getCount() == 1) {
            self._count -= 1
            self._root = nil
        } else {
            var pivot = self._root?.left
            var forest: Queue<PairingHeap<T, K>> = Queue<PairingHeap<T, K>>()
            self._root!._leftChild = nil
            
            while (pivot != nil) {
                pivot?._parent = nil
                forest.enqueue(PairingHeap(root: pivot!, comparator: self.comparator))
                if (pivot?.right != nil) {
                    pivot = pivot?.right
                    pivot?.parent?._rightChild = nil
                } else {
                    pivot?._parent = nil
                    pivot = nil
                }
            }
            
            while (!forest.isEmpty) {
                let heapA = forest.dequeue()
                
                if (forest.isEmpty) {
                    
                    self._root = heapA?.getRoot()
                    self._count -= 1
                    
                } else {
                    
                    let heapB = forest.dequeue()
                    forest.enqueue((heapA?.mergeTrees(heapA!, heapB!))!)
                }
            }
        }
    }
    
    public func deleteNode(_ node: PairingHeapNode<T, K>) {
        self.increase(node)
        self.delete()
    }
    
    //MARK: - Increase
    public func increase(_ node: PairingHeapNode<T, K>) {
        
        var pivot = node
        var hops = 0
        if (pivot.parent != nil) {
            while (pivot.parent != nil) {
                if (pivot.parent?.right != nil) {
                    if (comparator((pivot.parent?.right?.value)!, pivot.value) == .orderedSame) {
                        pivot = pivot.parent!
                        hops += 1
                    } else {
                        break
                    }
                } else {
                    break
                }
            }
            let parent = pivot.parent
            if (parent != nil) {
                if (comparator((parent?.value)!, node.value) == .orderedDescending) {
                    if (node.right != nil) {
                        if (hops > 0) {
                            node.parent?._rightChild = node.right
                        } else {
                            node.parent?._leftChild = node.right
                        }
                        node.right?._parent = node.parent
                    } else {
                        if (hops > 0) {
                            node.parent?._rightChild = nil
                        } else {
                            node.parent?._leftChild = nil
                        }
                    }
                    node._parent = nil
                    _ = self.merge(self.getRoot()!, node)
                }
            }
        }
    }
    
    //MARK: - Decrease
    public func decrease(_ node: PairingHeapNode<T, K>) {
        
        var pivot = node.left
        var consolidation = false
        
        while (pivot != nil) {
            
            if (comparator(node.value, (pivot?.value)!) == .orderedDescending) {
                consolidation = true
                break
            }
            
            pivot = pivot?.right
        }
        
        if consolidation {
            
            var forest: Queue<PairingHeap<T, K>> = Queue<PairingHeap<T, K>>()
            forest.enqueue(PairingHeap(root: node, comparator: self.comparator))
            
            let parent = node.parent
            let right = node.right
            
            var parentIsBrother = false
            if (parent?.right != nil) {
                if (comparator((parent?.right?.value)!, node.value) == .orderedSame) {
                    parentIsBrother = true
                }
            }
            
            node._parent = nil
            node._rightChild = nil
            var pivot = node.left
            node._leftChild = nil
            
            while (pivot != nil) {
                pivot?._parent = nil
                forest.enqueue(PairingHeap(root: pivot!, comparator: self.comparator))
                if (pivot?.right != nil) {
                    pivot = pivot?.right
                    pivot?.parent?._rightChild = nil
                } else {
                    pivot?._parent = nil
                    pivot = nil
                }
            }
            
            while (!forest.isEmpty) {
                let heapA = forest.dequeue()
                
                if (forest.isEmpty) {
                    
                    if (parent == nil) {
                        self._root = heapA?.getRoot()
                    } else {

                        if (parentIsBrother) {
                            parent?._rightChild = heapA?.getRoot()
                        } else {
                            parent?._leftChild = heapA?.getRoot()
                        }
                        
                        heapA?.getRoot()!._parent = parent
                        heapA?.getRoot()?._rightChild = right
                        right?._parent = heapA?.getRoot()
                    }
                    
                } else {
                    
                    let heapB = forest.dequeue()
                    forest.enqueue((heapA?.mergeTrees(heapA!, heapB!))!)
                }
            }
        }
    }
    
    //MARK: - Level order
    public func levelOrder() -> [T] {
           
        var result: [T] = []
        var discoveredNodes: [PairingHeapNode<T, K>] = [self._root!]
        discoveredNodes.reserveCapacity(self._count)
       
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
}

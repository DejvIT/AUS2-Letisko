//
//  SplayTree.swift
//  PavlickoDavidAUS2-1
//
//  Created by MaestroDavo on 13/10/2019.
//  Copyright © 2019 David Pavlicko. All rights reserved.
//

import Foundation

public class SplayTree<T> {
  
    private let comparator: Comparator
    public private(set)var _root: SplayNode<T>?
    private var _count: Int = 0
    
    public init(_ comparator: @escaping Comparator) {
        self.comparator = comparator
    }
    
    deinit {
        print("Splay tree is being deallocated.")
    }
    
    public func getCount() -> Int {
        return self._count
    }
    
    public func getRoot() -> SplayNode<T>? {
        return self._root
    }
    
    //MARK: - Insert
    public func insert(_ newItem: T) -> T? {
        
        guard let root = self._root else {
            self._root = SplayNode(newItem)
            _count += 1
            return newItem
        }
        
        var pivot = root
        
        while true {
            
            switch (comparator(newItem, pivot.value)) {
            case .orderedSame:
                return nil
            case .orderedAscending:
                if (pivot.left == nil) {
                    pivot._leftChild = SplayNode(newItem)
                    pivot._leftChild?._parent = pivot
                    _count += 1

                    // Splaying the new node to the top of the tree
                    self.splay(node: pivot.left!)
                    
                    return newItem
                } else {
                    pivot = pivot.left!
                }
            case .orderedDescending:
                if (pivot.right == nil) {
                    pivot._rightChild = SplayNode(newItem)
                    pivot._rightChild?._parent = pivot
                    _count += 1
                    
                    // Splaying the new node to the top of the tree
                    self.splay(node: pivot.right!)
                    
                    return newItem
                } else {
                    pivot = pivot.right!
                }
            default:
                return nil
            }
        }
    }
    
    //MARK: - Level order
    public func levelOrder() -> [T] {
           
        var result: [T] = []
        var discoveredNodes: [SplayNode<T>] = [self._root!]
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
    
    //MARK: - In order
    public func inOrder() -> [T] {
        
        var result: [T] = []
        var discoveredNodes: [SplayNode<T>] = []
        var pivot = self._root
      
        while (pivot != nil || discoveredNodes.isEmpty == false)
        {
            while (pivot !=  nil)
            {
                discoveredNodes.append(pivot!)
                pivot = pivot?.left
            }
            
            pivot = discoveredNodes[discoveredNodes.count - 1]
            discoveredNodes.remove(at: discoveredNodes.count - 1)
      
            result.append(pivot!.value)
            
            pivot = pivot?.right
      
        }
        
        return result
    }
    
    //MARK: - Search
    public func search(_ item: T, delete: Bool, closest: Bool) -> SplayNode<T>? {
        
        guard var pivot = self._root else {
            return nil
        }
        
        while true {
            
            switch (comparator(item, pivot.value)) {
            case .orderedSame:
                if (!delete) {
                    self.splay(node: pivot)
                }
                return pivot
            case .orderedAscending:
                if (pivot.left == nil) {
                    if (!delete) {
                        self.splay(node: pivot)
                    }
                    if (closest) {
                        return pivot
                    } else {
                        return nil
                    }
                } else {
                    pivot = pivot.left!
                }
            case .orderedDescending:
                if (pivot.right == nil) {
                    if (!delete) {
                        self.splay(node: pivot)
                    }
                    if (closest) {
                        return pivot.right
                    }
                    return nil
                } else {
                    pivot = pivot.right!
                }
            default:
                return nil
            }
        }
    }
    
    //MARK: - Delete
    public func delete(_ item: T) -> Bool {
        
        guard let foundNode = self.search(item, delete: true, closest: false) else {
            return false
        }

        let parent = foundNode.parent
        
        if (foundNode.left == nil && foundNode.right == nil) {  //LIST
            
            if (parent == nil) {
                
                self._root = nil
                
            } else {
                
                if (parent?.left != nil) {
                    
                    if (comparator((parent?.left?.value)!, foundNode.value) == .orderedSame) {
                        parent?._leftChild = nil
                    } else {

                        parent?._rightChild = nil
                    }
                } else {

                    parent?._rightChild = nil
                }
            
                foundNode._parent = nil
            
            }
            
        } else if ((foundNode.left != nil && foundNode.right == nil) || (foundNode.left == nil && foundNode.right != nil)) {    //Has one subtree
            
            if (parent == nil) { //parent not found, foundNode is root

                if (foundNode.left != nil) {    //check if root has leftChild
                    self._root = foundNode.left
                } else {
                    self._root = foundNode.right
                }
                
                self._root?._parent = nil
                
            } else {    //skontrolovane
                
                if (foundNode.left != nil) {

                    if (parent?.left != nil) {

                        if (comparator((parent?.left?.value)!, foundNode.value) == .orderedSame) {
                            
                            parent?._leftChild = foundNode.left
                            foundNode.left?._parent = parent
                            
                        } else {
                            
                            parent?._rightChild = foundNode.left
                            foundNode.left?._parent = parent
                        }
                        
                    } else {

                        parent?._rightChild = foundNode.left
                        foundNode.left!._parent = parent
                    }

                    foundNode._leftChild = nil
                    
                } else {    //skontrolovane

                    if (parent?.left != nil) {

                        if (comparator((parent?.left?.value)!, foundNode.value) == .orderedSame) {
                            
                            parent?._leftChild = foundNode.right
                            foundNode.right?._parent = parent
                            
                        } else {

                            parent?._rightChild = foundNode.right
                            foundNode.right?._parent = parent
                        }

                        
                    } else {

                        parent?._rightChild = foundNode.right
                        foundNode.right!._parent = parent
                    }

                    foundNode._rightChild = nil
                }

                foundNode._parent = nil
            }
            
        } else {

            let leftSubPivot = foundNode.left!
            let rightSubPivot = foundNode.right!
            let newNode = self.findMaxOfLeftSubTree(subPivot: leftSubPivot)
            let newNodeParent = newNode.parent

            newNode._parent = parent
            
            if (parent != nil) {
                if (comparator(parent?.value as Any, newNode.value) == .orderedAscending) {
                    parent?._rightChild = newNode
                } else {
                    parent?._leftChild = newNode
                }
            }
            
            newNode._rightChild = rightSubPivot
            
            if (foundNode.right != nil) {
                rightSubPivot._parent = newNode
            }
            
            if (comparator(newNode.value, leftSubPivot.value) != . orderedSame) {
                
                if (newNode.left != nil) {
                    newNodeParent!._rightChild = newNode.left
                    newNodeParent?._rightChild?._parent = newNodeParent
                } else {
                    newNodeParent!._rightChild = nil
                }
                
                newNode._leftChild = leftSubPivot
                leftSubPivot._parent = newNode
                
            }

        }
        
        self._count -= 1

        // Splaying of the parent to the top of the tree
        if (parent != nil) {
            self.splay(node: parent!)
        }
        
        return true
    }
    
    //MARK: - Find max of left subtree
    public func findMaxOfLeftSubTree(subPivot: SplayNode<T>) -> SplayNode<T> {
        
        var pivot = subPivot
        while true {
            
            if (pivot.right != nil) {
                pivot = pivot.right!
            } else {

                return pivot
            }
        }
    }
    
    //MARK: - Splay
    public func splay(node: SplayNode<T>) {
        
        let pivot = node
        
        while pivot.parent != nil {

            let parent = pivot.parent
            let grandParent = pivot.parent?.parent
            let leftSubTree = pivot.left
            let rightSubTree = pivot.right
            
            //1. pivot's parent is a root of the tree
            if (grandParent == nil) {
                
//                print("simple rotation")
                //Left sided node
                if (comparator(pivot.value, parent!.value) == .orderedAscending) {

                    self._root = pivot
                    self._root?._parent = nil
                    self._root?._rightChild = parent
                    parent?._parent = pivot
                    
                    if (rightSubTree != nil) {
                        
                        parent?._leftChild = rightSubTree
                        rightSubTree?._parent = self._root?.right
                        
                    } else {
                        parent?._leftChild = nil
                    }
                    
                } else {    //Right sided node
                    
                    self._root = pivot
                    self._root?._parent = nil
                    self._root?._leftChild = parent
                    parent?._parent = pivot
                    
                    if (leftSubTree != nil) {
                        
                        parent?._rightChild = leftSubTree
                        leftSubTree?._parent = self._root?.left
                        
                    } else {
                        parent?._rightChild = nil
                    }
                }
            } else {
                
                let parentLeftSubTree = parent?.left
                let parentRightSubTree = parent?.right
                
                //2. pivot has a grandparent and both are same side
                // Left sided
                if ((comparator(pivot.value, parent!.value) == .orderedAscending) && (comparator(parent!.value, grandParent!.value) == .orderedAscending)) {
                    
//                    print("both are left sided")
                    
                    pivot._parent = grandParent?.parent
                    
                    if (grandParent?.parent != nil) {
                        
                        if (comparator(grandParent?.value as Any, grandParent?.parent?.value as Any) == .orderedAscending) {
                            
                            grandParent?.parent!._leftChild = pivot
                            
                        } else {
                            
                            grandParent?.parent!._rightChild = pivot
                        }
                        
                    } else {
                        self._root = pivot
                    }
                    
                    pivot._rightChild = parent
                    parent?._parent = pivot
                    
                    if (rightSubTree != nil) {

                        parent?._leftChild = rightSubTree
                        rightSubTree?._parent = parent

                    } else {
                        parent?._leftChild = nil
                    }
                    
                    parent?._rightChild = grandParent
                    grandParent?._parent = parent
                    
                    if (parentRightSubTree != nil) {
                        
                        grandParent?._leftChild = parentRightSubTree
                        parentRightSubTree?._parent = grandParent
                        
                    } else {
                        
                        grandParent?._leftChild = nil
                    }
                    
                } else if ((comparator(pivot.value, parent!.value) == .orderedDescending) && (comparator(parent!.value, grandParent!.value) == .orderedDescending)) {  // Right sided
                    
//                    print("both are right sided")
                    
                    pivot._parent = grandParent?.parent
                    
                    if (grandParent?.parent != nil) {
                        
                        if (comparator(grandParent?.value as Any, grandParent?.parent?.value as Any) == .orderedDescending) {
                            
                            grandParent?.parent!._rightChild = pivot
                            
                        } else {
                            
                            grandParent?.parent!._leftChild = pivot
                        }
                        
                    } else {
                        self._root = pivot
                    }
                    
                    pivot._leftChild = parent
                    parent?._parent = pivot
                    
                    if (leftSubTree != nil) {

                        parent?._rightChild = leftSubTree
                        leftSubTree?._parent = parent

                    } else {
                        parent?._rightChild = nil
                    }
                    
                    parent?._leftChild = grandParent
                    grandParent?._parent = parent
                    
                    if (parentLeftSubTree != nil) {
                        
                        grandParent?._rightChild = parentLeftSubTree
                        parentLeftSubTree?._parent = grandParent
                        
                    } else {
                        
                        grandParent?._rightChild = nil
                    }
                    
                } else if ((comparator(pivot.value, parent!.value) == .orderedAscending) && (comparator(parent!.value, grandParent!.value) == .orderedDescending)) {  //3. combination, left sided node and right sided parent
                    
//                    print("node is left sided, but the parent is right sided")
                    
                    pivot._parent = grandParent?.parent
                    
                    if (grandParent?.parent != nil) {
                        
                        if (comparator(grandParent?.value as Any, grandParent?.parent?.value as Any) == .orderedAscending) {
                            
                            grandParent?.parent!._leftChild = pivot
                            
                        } else {
                            
                            grandParent?.parent!._rightChild = pivot
                        }
                        
                    } else {
                        self._root = pivot
                    }
                    
                    pivot._rightChild = parent
                    parent?._parent = pivot
                    pivot._leftChild = grandParent
                    grandParent?._parent = pivot
                    
                    if (rightSubTree != nil) {

                        parent?._leftChild = rightSubTree
                        rightSubTree?._parent = parent

                    } else {
                        parent?._leftChild = nil
                    }
                    
                    if (leftSubTree != nil) {
                        
                        grandParent?._rightChild = leftSubTree
                        leftSubTree?._parent = grandParent
                        
                    } else {
                        grandParent?._rightChild = nil
                    }
                    
                } else {  //right sided node and left sided parent
                    
//                    print("node is right sided, but the parent is left sided")
                    
                    pivot._parent = grandParent?.parent
                    
                    if (grandParent?.parent != nil) {
                        
                        if (comparator(grandParent?.value as Any, grandParent?.parent?.value as Any) == .orderedAscending) {
                            
                            grandParent?.parent!._leftChild = pivot
                            
                        } else {
                            
                            grandParent?.parent!._rightChild = pivot
                        }
                        
                    } else {
                        self._root = pivot
                    }
                    
                    pivot._leftChild = parent
                    parent?._parent = pivot
                    pivot._rightChild = grandParent
                    grandParent?._parent = pivot
                    
                    if (rightSubTree != nil) {

                        grandParent?._leftChild = rightSubTree
                        rightSubTree?._parent = grandParent

                    } else {
                        grandParent?._leftChild = nil
                    }
                    
                    if (leftSubTree != nil) {
                        
                        parent?._rightChild = leftSubTree
                        leftSubTree?._parent = parent
                        
                    } else {
                        parent?._rightChild = nil
                    }
                }
            }
        }
        
    }
    
}

import UIKit

// 先定义一个树
public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    
    public init(_ val: Int) {
        self.val = val
        self.left = nil
        self.right = nil
    }
}

class Solution {
    // 617.合并二叉树
    func mergeTrees1(_ t1: TreeNode?, _ t2: TreeNode?) -> TreeNode? {
        
        guard t1 != nil else {
            return t2
        }
        guard t2 != nil else {
            return t1
        }
        let head: TreeNode = TreeNode(t1!.val + t2!.val)
        head.left = mergeTrees1(t1?.left, t2?.left)
        head.right = mergeTrees1(t1?.right, t2?.right)
        
        return head
    }
    
    func mergeTrees2(_ t1: TreeNode?, _ t2: TreeNode?) -> TreeNode? {
        if nil == t1 || nil == t2 {
            return nil == t1 ? t2 : t1
        } else {
            t1?.val = (t1?.val)! + (t2?.val)!
            t1?.left = mergeTrees2(t1?.left, t2?.left)
            t1?.right = mergeTrees2(t1?.right, t2?.right)
            return t1
        }
    }
    
    // 104.二叉树的最大深度
    func maxDepth(_ root: TreeNode?) -> Int {
        return root == nil ? 0 : max(maxDepth(root?.left), maxDepth(root?.right)) + 1
    }
    
    func maxDepth2(_ root: TreeNode?) -> Int {
        guard root != nil else { return 0 }
        
        if root?.left == nil && root?.right == nil { return 1 }
        
        return max(maxDepth2(root?.left), maxDepth2(root?.right)) + 1
    }
    
    // 111.二叉树的最小深度
    func minDepth(_ root: TreeNode?) -> Int {
        guard root != nil else { return 0 }
        
        let left: Int = minDepth(root?.left)
        let right: Int = minDepth(root?.right)
        
        return (left>0 && right>0) ? 1+min(left, right) : 1+left+right
    }
    
    // 110.平衡二叉树的判断
    func isBalanced(_ root: TreeNode?) -> Bool {
        
        guard root != nil else { return true }
        
        if abs(maxDepth(root?.left) - maxDepth(root?.right)) > 1 { return false }
        
        guard true == isBalanced(root?.left) else { return false }
        
        guard true == isBalanced(root?.right) else { return false }
        
        return true
    }
    
    // 226.翻转二叉树
    func invertTree(_ root: TreeNode?) -> TreeNode? {
        guard root != nil else { return nil }
        
        let left = root?.left
        root?.left = invertTree(root?.right)
        root?.right = invertTree(left)
        return root
    }
    
    // 700.二叉搜索树中的搜索
    func searchBST(_ root: TreeNode?, _ val: Int) -> TreeNode? {
        guard root != nil else { return nil }
        guard root?.val != val else { return root }
        
        if root?.val ?? 0 > val {
            return searchBST(root?.left, val)
        } else {
            return searchBST(root?.right, val)
        }
    }
    
    // 404.左叶子之和
    var count: Int = 0
    
    func sumOfLeftLeaves(_ root: TreeNode?) -> Int {
        guard root != nil else { return count }
        
        //
        if root?.left != nil && root?.left?.left == nil && root?.left?.right == nil {
            count += root?.left?.val ?? 0
        }
        
        sumOfLeftLeaves(root?.left)
        sumOfLeftLeaves(root?.right)
        return count
    }
    
    
    func sumOfLeftLeaves2(_ root: TreeNode?) -> Int {
        if nil == root {
            return 0
        } else {
            let left =  root?.left
            let right =  root?.right
            if nil == left {
                return sumOfLeftLeaves2(right)
            } else {
                if nil == left?.left && nil == left?.right {
                    return (left?.val)! + sumOfLeftLeaves2(right)
                } else {
                    return sumOfLeftLeaves2(left) + sumOfLeftLeaves2(right)
                }
            }
        }
    }
    
    
    // 965.单值二叉树
    func isUnivalTree(_ root: TreeNode?) -> Bool {
        guard nil != root else { return true }
        if (root?.left == nil || root?.left?.val == root?.val) && (root?.right == nil || root?.right?.val == root?.val){
            return isUnivalTree(root?.left) && isUnivalTree(root?.right)
        }
        return false
    }
    
    
    //101.对称二叉树
    func isSymmetric(_ root: TreeNode?) -> Bool {
        return checkSymmetry(root, root)
    }
    
    func checkSymmetry(_ left: TreeNode?, _ right: TreeNode?) -> Bool {
        if left == nil && right == nil { return true }
        if left == nil || right == nil { return false }
        guard left?.val == right?.val else { return false }
        return checkSymmetry(left?.left, right?.right) && checkSymmetry(left?.right, right?.left)
    }
}


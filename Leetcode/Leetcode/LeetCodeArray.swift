//
//  LeetCodeArray.swift
//  Leetcode
//
//  Created by sunny on 2019/3/1.
//  Copyright © 2019 sunny. All rights reserved.
// .DS_Store

import UIKit

class LeetCodeArray: NSObject {

    static let instance = LeetCodeArray()

    //27:Two Pointers T: O(n) S: O(1)
    func removeElement(_ nums: inout [Int], _ val: Int) -> Int {
        if nums.count == 0 { return 0 }
        var i = 0
        for j in 0..<nums.count {
            if nums[j] != val {
                nums[i] = nums[j]
                i += 1
            }
        }
        return i
    }
    //27:Two Pointers T: O(n) S: O(1)
    func removeElement2(_ nums: inout [Int], _ val: Int) -> Int {
        if nums.count == 0 {return 0}
        var i = 0
        var n = nums.count
        while i < n {
            if nums[i] == val {
                nums[i] = nums[n-1]
                n -= 1
            } else {
                i += 1
            }
        }
        return n
    }
    //27
    func removeElement3(_ nums: inout [Int], _ val: Int) -> Int {
        if nums.count == 0 { return 0}

        for i in (0..<nums.count).reversed() {
            if nums[i] == val {
                nums.remove(at: i)
            }
        }
        return nums.count
    }

    //26、T: O(n), S: O(1)
    func removeDuplicates(_ nums: inout [Int]) -> Int {
        if nums.count == 0 { return 0}

        var i = 0
        for j in 1..<nums.count {
            if nums[j] != nums[i] {
                i += 1
                nums[i] = nums[j]
            }
        }
        return i + 1
    }
}

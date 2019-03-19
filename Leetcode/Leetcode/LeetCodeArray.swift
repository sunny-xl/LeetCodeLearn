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
    //80 T: O(n), S: O(1)
    func removeDuplicatesII(_ nums: inout [Int]) -> Int {
        if nums.count == 0 {return 0}

        var i = 0
        for n in nums {
            if i < 2 || n > nums[i-2] {
                nums[i] = n
                i += 1
            }
        }
        return i
    }

    /* 189  T: O(n), S: O(1)
     The basic idea is that, for example, nums = [1,2,3,4,5,6,7] and k = 3, first we reverse [1,2,3,4], it becomes[4,3,2,1]; then we reverse[5,6,7], it becomes[7,6,5], finally we reverse the array as a whole, it becomes[4,3,2,1,7,6,5] ---> [5,6,7,1,2,3,4].

     Reverse is done by using two pointers, one point at the head and the other point at the tail, after switch these two, these two pointers move one position towards the middle.
     */
    func rotate(_ nums: inout [Int], _ k: Int) {
        if nums.count <= 1 {return }

        let i = k % nums.count
        reverse(&nums,0,nums.count-1-i)
        reverse(&nums,nums.count-i,nums.count-1)
        reverse(&nums,0,nums.count-1)

    }

    private func reverse(_ nums: inout [Int], _ i: Int, _ j: Int) {
        var temp = 0
        var start = i
        var end = j
        while start < end {
            temp = nums[start]
            nums[start] = nums[end]
            nums[end] = temp
            start += 1
            end -= 1
        }
    }

    //41 T: O(n), S: O(1)
    func firstMissingPositive(_ nums: [Int]) -> Int {
        var arr = nums
        let n = arr.count
        for i in 0..<n {
            while (arr[i] > 0 && arr[i] <= n && arr[arr[i] - 1] != arr[i]) {
                let temp = arr[i]
                arr[i] = arr[arr[i]-1]
                arr[temp-1] = temp
            }
        }

        for i in 0..<n {
            if arr[i] != i + 1 {
                return i + 1
            }
        }
        return n + 1
    }
}

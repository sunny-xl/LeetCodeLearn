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

    //299、这个是discuss中的hot思路，真的是充满了智慧，尤其体现在处理cows的地方。创建了一个长度为10的int数组，因为每个位置的数字范围就是0——9，数组的index就对应0——9，而index对应的元素值表示secret中该index出现的次数。如果secret出现一次某个数字，该位置就自增1，如果此时该位置小于0，就说明这个数字在guess出现过，因此cows就自增1；guess的处理和secret类似，区别就是index对应元素需要自减。

    func getHint(_ secret: String, _ guess: String) -> String {
        guard secret.count == guess.count else {
            return ""
        }
        var bulls = 0
        var cows = 0
        var numbers = [0,0,0,0,0,0,0,0,0,0]
        for i in 0..<secret.count {
            let sIndex = secret.index(secret.startIndex, offsetBy: i)
            let gIndex = guess.index(guess.startIndex, offsetBy: i)
            let s =  String.init(secret[sIndex])
            let g =  String.init(guess[gIndex])
            if  s == g {
                bulls += 1
            } else {
                if numbers[Int(s)!] < 0 {cows += 1}
                if numbers[Int(g)!] > 0 {cows += 1}
                numbers[Int(s)!] += 1
                numbers[Int(g)!] -= 1
            }
        }
        return "\(bulls)A\(cows)B"
    }

    //134 If the total number of gas is bigger than the total number of cost. There must be a solution.
    func canCompleteCircuit(_ gas: [Int], _ cost: [Int]) -> Int {
        var remain = 0
        var start = 0
        var debt = 0
        for i in 0..<gas.count {
            remain = remain + gas[i] - cost[i]
            if remain < 0 {
                debt += remain
                start = i + 1
                remain = 0
            }
        }
        return remain + debt < 0 ? -1 : start
    }
}

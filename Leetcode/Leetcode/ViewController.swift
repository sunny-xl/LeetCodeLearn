//
//  ViewController.swift
//  Leetcode
//
//  Created by sunny on 2019/2/5.
//  Copyright © 2019 sunny. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
         testArray()
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)

        testArray()
    }

    func testArray() {
        var nums = [2,34,32,12,2]
        let result = LeetCodeArray.instance.removeElement(&nums, 2)
        print(result)
    }

}

class SortMethods: NSObject {

    //冒泡排序
    func bubbleSort(_ nums: inout [Int]) -> [Int] {
        for i in 0..<nums.count-1 {
            for j in 0..<nums.count-i-1 {
                if nums[j] > nums[j+1] {
                    let temp = nums[j]
                    nums[j] = nums[j+1]
                    nums[j+1] = temp
                }
            }
        }
        return nums
    }

    //选择排序
    func simpleSelectSort(_ nums: inout [Int]) -> [Int] {
        for i in 0..<nums.count {
            for j in i+1..<nums.count {
                if nums[i] > nums[j] {
                    let temp = nums[i]
                    nums[i] = nums[j]
                    nums[j] = temp
                }
            }
        }
        return nums
    }

    //快速排序
    func quickSort(_ nums: inout [Int], _ left: Int,_ right: Int) {
        guard left >= right else {return } //一个元素直接退出

        var i = left
        var j = right //left是首元素下标，right是最后一个元素的下标
        let temp = nums[i] //把首元素当做基准数

        while i != j {
            while nums[j] >= temp && i < j {//因为把首元素当基准，故先从右向左找
                j -= 1
            }

            while nums[i] <= temp && i < j { //再从左向右找
                i += 1
            }

            while i < j { //i和j没有相遇，交换两个数在数组中的位置
                let t = nums[i]
                nums[i] = nums[j]
                nums[j] = t
            }
        }
        nums[left] = nums[i] //i和j相遇，i=j,把i位置的数放到数组的最前面
        nums[i] = temp // 把比较的基准数放到i的位置 //最终将基准数归位

        quickSort(&nums, left, i-1) //继续处理左边的，这里是一个递归的过程
        quickSort(&nums, i+1, right)//继续处理右边的，这里是一个递归的过程
    }
}


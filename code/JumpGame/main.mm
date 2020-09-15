//
//  main.m
//  JumpGame
//
//  Created by 高超 on 2020/9/7.
//  Copyright © 2020 高超. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#include <stdio.h>
#include <stdlib.h>
#include <iostream>
using namespace std;


int minSteps1(int *nums,int size)
{
    int position = size - 1;
    int steps = 0;
    while (position > 0) {
        for (int i = 0; i < position; i++) {
            if (i + nums[i] >= position) {
                position = i;
                steps++;
                break;
            }
        }
    }
    return steps;
}


int minSteps2(int *nums,int size)
{
    int currMaxIdx = 0;   // 当前跳跃范围最远坐标
    int nextMaxIdx = 0;   // 下一个跳跃范围最远坐标
    int steps = 0;        // 步数
    int target = size - 1;
    for (int i = 0; i <= currMaxIdx; ++i) {   // 在当前跳跃范围内遍历，获得下次跳跃能到达的最远距离
        nextMaxIdx = max(nextMaxIdx, i + nums[i]);
        if (nextMaxIdx >= target){
            return steps + 1;     // 提前结束
        }
        if (i == currMaxIdx) {    // 更新跳跃范围与跳跃次数
            currMaxIdx = nextMaxIdx;
            ++steps;
        }
    }
    return steps;
}

int main(int argc, char * argv[]) {
    int nums[] = {2,3,1,1,4,2,1};
    int size = sizeof(nums)/sizeof(nums[0]);
    int step = minSteps1(nums,size);
    NSLog(@"最少步数：%d",step);

    int step2 = minSteps2(nums,size);
    NSLog(@"最少步数：%d",step2);

}


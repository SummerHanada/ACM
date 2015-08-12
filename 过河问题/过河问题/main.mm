//
//  main.m
//  过河问题
//
//  Created by xuqianlong on 15/8/12.
//  Copyright (c) 2015年 夕阳栗子. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "People.h"
#include <array>

#ifdef DEBUG

#define P2go(__a,__b)   printf("%d和%d一起过去；花费：%d;",__a,__b,a[__b]);
#define Pback(__a)      printf("然后%d返回；花费：%d;\n",__a,a[__a]);
#define P3              printf("剩下3个人需要花费：%d\n",a[0] + a[1] + a[2]);
#define P2              printf("剩下2个人需要花费：%d\n",a[1]);
#define P1              printf("只有1个人需要花费：%d\n",a[0]);

#else

#define P2go(__a,__b)
#define Pback(__a)
#define P3
#define P2
#define P1

#endif

int computeMinTime(int a[],int size)
{
    sort(a, a + size);
    
//    for (int i = 0; i < size; i ++) {
//        printf("e:%d\n",a[i]);
//    }
    
    int sumTimeNeed = 0;
    
    while (size > 3) {
        int time1 = a[1] + a[0] + a[size-1] + a[1] ;
        int time2 = a[size-1] + a[0] + a[size-2] + a[0];
        if (time1 < time2) {
            P2go(0,1);
            Pback(0);
            P2go(size-2,size-1);
            Pback(1);
        }else{
            P2go(0,size-1);
            Pback(0);
            P2go(0,size-2);
            Pback(0);
        }
        size -= 2;
        sumTimeNeed += MIN(time1, time2);
    }
    
    if (size == 3) {
        sumTimeNeed += a[0] + a[1] + a[2];
        P3;
    }else if (size == 2){
        sumTimeNeed += a[1];
        P2;
    }else if (size == 1){
        sumTimeNeed += a[0];
        P1;
    }
    
    return sumTimeNeed;
}

int main(int argc, const char * argv[]) {
    @autoreleasepool
    {
        int people[] = {1,2,5,10};
        int sumTimeNeed = computeMinTime(people,4);
        printf("\n---needTime:%d",sumTimeNeed);
    }
    return 0;
}
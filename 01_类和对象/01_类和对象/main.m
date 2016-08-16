//
//  main.m
//  01_类和对象
//
//  Created by 邓江洲 on 16/8/15.
//  Copyright © 2016年 邓江洲. All rights reserved.
//

#import <Foundation/Foundation.h>




@interface Person : NSObject {

    
    int age;
    




}

@end


@implementation Person











@end







int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
     
        
        
        
        NSLog(@"Hello");
        
        
        int a = 10;
        NSLog(@"a= %d", a);
        
        
        
        
//        [Person new];
        Person *p = [Person alloc];
        
        
        
        
        
        
        
        p = [p init];
        
        
        
        
        
        Person *pp = [[Person alloc]init];
        
        
        
        
        
        
        
        
        
        
        
        
        
        
    }
    return 0;
}

//
//  main.m
//  02_类和对象
//
//  Created by 邓江洲 on 16/8/15.
//  Copyright © 2016年 邓江洲. All rights reserved.
//

#import <Foundation/Foundation.h>




@interface Dog : NSObject{


      @public int _age;

    





}

@end



@implementation Dog












@end







int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
      
        
        
        Dog *d = [[Dog alloc]init];
        
        
        int age = d->_age;
        
        
        NSLog(@"age = %d",age);
        
        
        d->_age = 100;
        
        
        
        int ageStruct = d->_age;
        NSLog(@"age = %d",ageStruct);
        
        
        
        
        
        
        
    }
    return 0;
}

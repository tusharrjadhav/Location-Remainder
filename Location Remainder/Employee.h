//
//  Employee.h
//  Location Remainder
//
//  Created by Nayamode on 11/12/12.
//  Copyright (c) 2012 Nayamode. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface Employee : NSObject
{
    NSInteger _id;
    NSString *empName;
    NSString *designation;
    
}
//window change
@property (nonatomic, readonly) NSInteger _id;
@property (nonatomic, copy) NSString *empName;
@property (nonatomic, copy) NSString *designation;



//Instance Method
- (id) initData:(NSString *)empName designation:(NSString *)designation;

@end

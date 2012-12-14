//
//  Employee.m
//  Location Remainder
//
//  Created by Nayamode on 11/12/12.
//  Copyright (c) 2012 Nayamode. All rights reserved.
//

#import "Employee.h"

@implementation Employee

@synthesize _id, empName, designation;

#pragma mark-
#pragma mark Static Method
#pragma mark-



#pragma mark-
#pragma mark Instance Method
#pragma mark-


- (id) initData:(NSString *)empName designation:(NSString *)designation
{
    if (self = [super init])
    {
        self.empName = empName;
        self.designation = designation;
    }
    return self;
}

@end

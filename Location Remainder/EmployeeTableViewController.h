//
//  EmployeeTableViewController.h
//  Location Remainder
//
//  Created by Nayamode on 11/12/12.
//  Copyright (c) 2012 Nayamode. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EmployeeTableViewController : UIViewController<UITableViewDataSource, UITableViewDelegate>
{
    IBOutlet UITableView *empTableView;
    NSMutableArray *empMArray;
}

@property (nonatomic, retain) NSMutableArray *empMArray;

- (IBAction)addMore:(id)sender;

@end

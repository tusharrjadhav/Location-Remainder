//
//  ViewController.m
//  Location Remainder
//
//  Created by Nayamode on 11/12/12.
//  Copyright (c) 2012 Nayamode. All rights reserved.
//

#import "ViewController.h"
#import "EmployeeTableViewController.h"

@interface ViewController ()

@end

@implementation ViewController


#pragma mark -
#pragma mark LifeCycle
#pragma mark -

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -
#pragma mark IBACTION
#pragma mark -

- (IBAction)add:(id)sender
{
    EmployeeTableViewController *empTable = [[EmployeeTableViewController alloc]initWithNibName:@"EmployeeTableViewController" bundle:nil];
    /*[empTable.empMArray addObject:[NSString stringWithFormat:@"%@-%@", nameUITField.text, designationUITField.text]];
    nameUITField.text = @"";
    designationUITField.text = @"";*/
    [self presentViewController:empTable animated:YES completion:nil];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
// called when 'return' key pressed. return NO to ignore.
{
    if(textField == nameUITField)
    {
        [nameUITField resignFirstResponder];
    }
    if(textField == designationUITField)
    {
        [designationUITField resignFirstResponder];
    }
    return TRUE;
}

@end

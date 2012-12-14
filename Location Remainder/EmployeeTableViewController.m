//
//  EmployeeTableViewController.m
//  Location Remainder
//
//  Created by Nayamode on 11/12/12.
//  Copyright (c) 2012 Nayamode. All rights reserved.
//

#import "EmployeeTableViewController.h"
#import "AppDelegate.h"
#import "Employee.h"
#import <sqlite3.h>

NSString * const DATABASE_NAME = @"demodata.sqlite";

NSString * const TABLE_DATA_KEY = @"TABLE DATA";

NSString * const TABLE_CELL_ID = @"Default cell id";

@interface EmployeeTableViewController ()

@end

@implementation EmployeeTableViewController


@synthesize empMArray; 

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    //AppDelegate *appdelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    
    if (self)
    {
        // Custom initialization
        
    }
    return self;
}

#pragma mark -
#pragma mark LifeCycle
#pragma mark -

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self copyDatabseIfNeed];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.

}

- (void)viewWillAppear:(BOOL)animated
{
    [self readAllData];
    NSLog(@"viewWillAppear");
    [empTableView reloadData];
}

- (void)viewDidDisappear:(BOOL)animated
{
    
}

#pragma mark -
#pragma mark TABLE DATA SOURCE
#pragma mark -

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [empMArray count];
}

// Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
// Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:TABLE_CELL_ID ];
    
    if(cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithFrame:CGRectZero reuseIdentifier:TABLE_CELL_ID];
    }
    
    //cell.textLabel.text = [empMArray objectAtIndex:indexPath.row];
    Employee *empObj = [empMArray objectAtIndex:indexPath.row];
    cell.textLabel.text = [NSString stringWithFormat:@"%@-%@",[empObj empName], [empObj designation]];
    return cell;
}

#pragma mark -
#pragma mark TABLE DELEGATE
#pragma mark -

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath;
{
    
}

#pragma mark -
#pragma mark IBACTION
#pragma mark -

- (IBAction)addMore:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark -
#pragma mark Databse Opration
#pragma mark -

- (NSString *) getDBPath
{
        return [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0] stringByAppendingPathComponent:DATABASE_NAME];
}

- (void) copyDatabseIfNeed
{
    BOOL success = [[NSFileManager defaultManager] fileExistsAtPath:[self getDBPath]];
    
    if (success)
    {
        return;
    }
    NSError *error;
    NSString *resDBPath = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:DATABASE_NAME];
    success = [[NSFileManager defaultManager] copyItemAtPath:resDBPath toPath:[self getDBPath] error:&error];
    
    if (!success)
    {
        NSAssert(0, @"Error: %@",[error localizedDescription]);
    }
}

- (void) readAllData
{
    NSLog(@"readAllData");
    sqlite3 * dataBase;
    empMArray = [[NSMutableArray alloc] init];
    
    if (sqlite3_open([[self getDBPath] UTF8String], &dataBase) != SQLITE_OK)
    {
        sqlite3_close(dataBase);
        NSAssert(0, @"Failed to open database");
    }
    
    const char *query = "SELECT * FROM employee";
    sqlite3_stmt *statement;
    
    if(sqlite3_prepare_v2(dataBase, query, -1, &statement, NULL) == SQLITE_OK)
    {
        NSLog(@"readAllData1");
        while (sqlite3_step(statement) == SQLITE_ROW)
        {
            NSLog(@"readAllData2");
            NSLog(@"name : %@",[NSString stringWithUTF8String:(char *)sqlite3_column_text(statement, 1)]);
            NSLog(@"designation : %@",[NSString stringWithUTF8String:(char *)sqlite3_column_text(statement, 2)]);
            
            Employee *empObj = [[Employee alloc]initData:[NSString stringWithUTF8String:(char *)sqlite3_column_text(statement, 1)] designation:[NSString stringWithUTF8String:(char *)sqlite3_column_text(statement, 2)]];
            [empMArray addObject:empObj];
        }
        sqlite3_finalize(statement);
    }
    sqlite3_close(dataBase);
    
}

@end

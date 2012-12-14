//
//  ViewController.h
//  Location Remainder
//
//  Created by Nayamode on 11/12/12.
//  Copyright (c) 2012 Nayamode. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITextFieldDelegate>
{
    IBOutlet UIButton *addUIButton;
    IBOutlet UITextField *nameUITField;
    IBOutlet UITextField *designationUITField;
}

- (IBAction)add:(id)sender;

@end

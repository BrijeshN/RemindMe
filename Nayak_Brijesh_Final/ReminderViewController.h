//
//  ReminderViewController.h
//  Nayak_Brijesh_Final
//
//  Created by Brijesh Nayak on 12/6/16.
//  Copyright © 2016 Brijesh Nayak. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ReminderViewController : UIViewController

- (IBAction)cancel:(UIBarButtonItem *)sender;
- (IBAction)save:(UIBarButtonItem *)sender;

@property (weak, nonatomic) IBOutlet UIDatePicker *picker;

@property (weak, nonatomic) IBOutlet UITextField *enterText;


@end

//
//  ReminderViewController.m
//  Nayak_Brijesh_Final
//
//  Created by Brijesh Nayak on 12/6/16.
//  Copyright © 2016 Brijesh Nayak. All rights reserved.
//

#import "ReminderViewController.h"

@interface ReminderViewController ()

@end

@implementation ReminderViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)cancel:(UIBarButtonItem *)sender {
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
}

- (IBAction)save:(UIBarButtonItem *)sender {
    
    NSDate *pickerDate = [self.picker date];
    UILocalNotification *localNotif = [[UILocalNotification alloc] init];
    localNotif.alertBody= _enterText.text;
    
    localNotif.fireDate = pickerDate;
    
    localNotif.timeZone = [NSTimeZone defaultTimeZone];
    
    localNotif.soundName = (UILocalNotificationDefaultSoundName);
    
    localNotif.applicationIconBadgeNumber = 1;
    
    //localNotif.repeatInterval = NSMinuteCalendarUnit;
    
    [[UIApplication sharedApplication] scheduleLocalNotification:localNotif];
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
    
}
@end

//
//  FirstTab.h
//  Nayak_Brijesh_Final
//
//  Created by Brijesh Nayak on 12/5/16.
//  Copyright © 2016 Brijesh Nayak. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FirstTab : UIViewController <UITableViewDataSource, UITableViewDelegate>
{
    NSMutableArray *courses;
    NSMutableArray *removeCourses;
}

@property (weak, nonatomic) IBOutlet UITextField *courseName;

- (IBAction)addCourse:(id)sender;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

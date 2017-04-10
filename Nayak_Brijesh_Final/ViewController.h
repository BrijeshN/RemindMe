//
//  ViewController.h
//  Nayak_Brijesh_Final
//
//  Created by Brijesh Nayak on 12/5/16.
//  Copyright © 2016 Brijesh Nayak. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

// Username Field
@property (weak, nonatomic) IBOutlet UITextField *userNameField;

// Password Field
@property (weak, nonatomic) IBOutlet UITextField *passwordField;

// Confirm Password Field
@property (weak, nonatomic) IBOutlet UITextField *confirmPasswordField;

// Confrim Password Label
@property (weak, nonatomic) IBOutlet UILabel *confirmPasswordLabel;

// Register Button
@property (weak, nonatomic) IBOutlet UIButton *registerButton;

// Login Button
@property (weak, nonatomic) IBOutlet UIButton *loginButton;



@end


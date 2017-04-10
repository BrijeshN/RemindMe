//
//  ViewController.m
//  Nayak_Brijesh_Final
//
//  Created by Brijesh Nayak on 12/5/16.
//  Copyright © 2016 Brijesh Nayak. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //class that allows simple storage of different data types
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    // Hide the login button if there is no registered user, else hide regiserbutton
    if(![defaults boolForKey:@"registered"]){
        NSLog(@"No registered user");
        
        // if there is no registered user hide login button
        _loginButton.hidden = YES;
    } else {
        NSLog(@"Registered user");
        
        // If there is a registered user, hide confirm password field and registerbutton
        _confirmPasswordField.hidden = YES;
        _confirmPasswordLabel.hidden = YES;
        _registerButton.hidden = YES;
    }
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
    
}

// Perform this action when user tap Register Button
- (IBAction)registerButtonTapped:(id)sender {
    
    // If one or more text field are empty displlay error message, or call checkPasswordMatch function to check passwords
    if([_userNameField.text isEqualToString:@""] || [_passwordField.text isEqualToString:@""] || [_confirmPasswordField.text isEqualToString:@""]){
        NSLog(@"ERROR: All field must be filled in");
        
        UIAlertController *error = [UIAlertController alertControllerWithTitle:@"ERROR" message:@"You must complete all field." preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
        
        [error addAction:defaultAction];
        [self presentViewController:error animated:YES completion:nil];
        
    } else {
        [self checkPasswordMatch];
    }

    
}

// Function to check Passwords
-(void) checkPasswordMatch{
    
    //If password and confirm password matched, call registerNewUser function to save the password, else diaply error on the screen
    if([_passwordField.text isEqualToString:_confirmPasswordField.text]){
        NSLog(@"Passwords match");
        [self registerNewUser];
        
    } else {
        NSLog(@"Password did not match");
        
        UIAlertController *error = [UIAlertController alertControllerWithTitle:@"ERROR" message:@"Passwords did not match" preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
        
        [error addAction:defaultAction];
        
        [self presentViewController:error animated:YES completion:nil];
        
        
    }
    
}

// Function to register new user
-(void) registerNewUser{
    
    // Allows simple storage of different data types
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    // Save username
    [defaults setObject:_userNameField.text forKey:@"username"];
    
    // Save password
    [defaults setObject:_passwordField.text forKey:@"password"];
    [defaults setBool:YES forKey:@"registered"];
    
    // Synchronize to save information to memory
    [defaults synchronize];
    
    // Navigate to specific view controller that has given identifier
    [self performSegueWithIdentifier:@"login" sender:self];
    
}


// Perform this action when user tap Login Button
- (IBAction)loginButtonTapped:(id)sender {
    
    // Allows simple storage of different data types
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    // If username and password match with previously saved data then LOGIN, else display error message
    if([_userNameField.text isEqualToString:[defaults objectForKey:@"username"]] && [_passwordField.text isEqualToString:[defaults objectForKey:@"password"]]){
        
        _userNameField.text = nil;
        _passwordField.text = nil;
        NSLog(@"Login");
        
    } else {
        NSLog(@"Incorrect Username or Password");
        
        UIAlertController *success = [UIAlertController alertControllerWithTitle:@"ERROR" message:@"Incorrect username or password" preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
        
        [success addAction:defaultAction];
        [self presentViewController:success animated:YES completion:nil];
        
    }
    
    // Navigate to specific view controller that has given identifier
    [self performSegueWithIdentifier:@"login" sender:self];
    
}


@end

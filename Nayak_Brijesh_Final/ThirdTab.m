//
//  ThirdTab.m
//  Nayak_Brijesh_Final
//
//  Created by Brijesh Nayak on 12/5/16.
//  Copyright © 2016 Brijesh Nayak. All rights reserved.
//

#import "ThirdTab.h"
#import "Social/Social.h"


@interface ThirdTab ()

@property (strong, nonatomic) IBOutlet UITextView *tweetTextView;

-(void) configureTweetTextView;
-(void) showAlertMessage:(NSString * ) myMessage;


@end

@implementation ThirdTab

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configureTweetTextView];
}


// a helping funtiocn
- (void) showAlertMessage: (NSString * ) myMessage{
    UIAlertController * alertController = [UIAlertController alertControllerWithTitle:@"Social Share" message:myMessage preferredStyle:UIAlertControllerStyleAlert];
    
    // add an OK button
    [alertController addAction:[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil]];
    
    // show it
    [self presentViewController:alertController animated:YES completion:nil];
}

- (IBAction)showShareAction:(UIBarButtonItem *)sender {
    
    // we need this to shut the keyboard if we need to
    if([self.tweetTextView isFirstResponder]){
        [self.tweetTextView resignFirstResponder];
    }
    
    // Here you can copy any handler to setup priorities
    
    UIActivityViewController *moreVC = [[UIActivityViewController alloc]initWithActivityItems:@[self.tweetTextView.text] applicationActivities:nil];
    [self presentViewController:moreVC animated:YES completion:nil];
    
}

- (void) configureTweetTextView{
    self.tweetTextView.layer.backgroundColor = [UIColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:1.0].CGColor;
    self.tweetTextView.layer.cornerRadius = 10.0;
    self.tweetTextView.layer.borderColor = [UIColor colorWithWhite:0.0 alpha:0.5].CGColor;
    self.tweetTextView.layer.borderWidth = 2.0;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

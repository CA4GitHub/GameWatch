//
//  FLLoginViewController.m
//  GameWatch
//
//  Created by Fredrick Lawton on 8/28/14.
//  Copyright (c) 2014 Fredrick A. Lawton. All rights reserved.
//

#import "FLLoginViewController.h"
#import <Parse/Parse.h>

@interface FLLoginViewController ()


@property (weak, nonatomic) IBOutlet UITextField *username;
@property (weak, nonatomic) IBOutlet UITextField *password;

@end

@implementation FLLoginViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.navigationController.navigationBarHidden = YES;
    self.tabBarController.tabBar.hidden = YES;
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


#pragma mark - IBActions
- (IBAction)logIn:(id)sender {
    NSLog(@"Log In");
    NSString *username = self.username.text;
    NSString *password = self.password.text;
    
    if ([username length]==0 || [password length]==0) {
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Entry error"
                                                            message:@"Please enter a valid username and password." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alertView show];
    }else{
        [PFUser logInWithUsernameInBackground:username password:password block:^(PFUser *user, NSError *error){
                                if (user) {
                                    // Do stuff after successful login.
                                    [self.navigationController popToRootViewControllerAnimated:YES];
                                    
                                } else {
                                    // The login failed. Check error to see why.
                                    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Error Logging in"
                                                                                        message:[error.userInfo objectForKey:@"error"]
                                                                                       delegate:nil
                                                                              cancelButtonTitle:@"OK"
                                                                              otherButtonTitles:nil];
                                    
                                    [alertView show];
                                }
        }];
    }
}
- (IBAction)goToSignUp:(id)sender {
    //hide keyboard so if user returns from Sign Up page the keyboard doesn't show initially
    [self hideKeyboard:sender];
    NSLog(@"Sign Up");
}
- (IBAction)enableSecureText:(id)sender {
    //hide password as type
    self.password.secureTextEntry = YES;
}

- (IBAction)hideKeyboard:(id)sender {
    //called when any of the following occurs
    //1) user presses done button on keyboard for username or password text fields
    //2) user has keyboard showing and taps on non-keyboard part of the screen
    
    //Sam's iOS6 p.216
    [self.username resignFirstResponder];
    [self.password resignFirstResponder];
    
}

@end

//
//  FLSignUpViewController.m
//  GameWatch
//
//  Created by Fredrick Lawton on 8/29/14.
//  Copyright (c) 2014 Fredrick A. Lawton. All rights reserved.
//

#import "FLSignUpViewController.h"
#import <Parse/Parse.h>

@interface FLSignUpViewController ()
@property (weak, nonatomic) IBOutlet UITextField *username;
@property (weak, nonatomic) IBOutlet UITextField *password;
@property (weak, nonatomic) IBOutlet UITextField *emailAddress;

@end

@implementation FLSignUpViewController

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
    // Do any additional setup after loading the view.
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
- (IBAction)signUpForGameWatch:(id)sender {
 
    
    NSString *username = self.username.text;
    NSString *password = self.password.text;
    NSString *emailAddress = self.emailAddress.text;
    
    //check in valid strings entered
    //this will need to be modified in the future
    if ([username length]==0 || [password length]==0 || [emailAddress length]==0) {
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Entry error" message:@"Please enter a valid username, email, and password." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alertView show];
    }else{
        
        //create PFUser object and assign values to its attributes
        PFUser *newUser = [PFUser user];
        newUser.username = username;
        newUser.password = password;
        newUser.email = emailAddress;
        
        [newUser signUpInBackgroundWithBlock:^(BOOL succeeded, NSError *error){
            if (error) {
                UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Error Signing UP"
                                                                    message:[error.userInfo objectForKey:@"error"]
                                                                   delegate:nil
                                                          cancelButtonTitle:@"OK"
                                                          otherButtonTitles:nil];
 
                [alertView show];
            }else{
                [self.navigationController popToRootViewControllerAnimated:YES];
            }
        }];
        
    }
  
   NSLog(@"Sign Up For Game Watch");
}

- (IBAction)goToLogin:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)enableSecureText:(id)sender {
    //hide password as type
    self.password.secureTextEntry = YES;
}

- (IBAction)hideKeyboard:(id)sender {
    //called when any of the following occurs
    //1) user presses done button on keyboard for username, password, or email address text fields
    //2) user has keyboard showing and taps on non-keyboard part of the screen
    
    //Sam's iOS6 p.216
    [self.username resignFirstResponder];
    [self.password resignFirstResponder];
    [self.emailAddress resignFirstResponder];
    
}

@end

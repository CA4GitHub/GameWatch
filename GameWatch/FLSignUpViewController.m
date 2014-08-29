//
//  FLSignUpViewController.m
//  GameWatch
//
//  Created by Fredrick Lawton on 8/29/14.
//  Copyright (c) 2014 Fredrick A. Lawton. All rights reserved.
//

#import "FLSignUpViewController.h"

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
    NSLog(@"Sign Up For Game Watch");
    
    //trime whitespaces & new lines at beginning & end of each textfields' text
    NSString *username = [self.username.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    NSString *password = [self.password.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    NSString *emailAddress = [self.emailAddress.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    
    //check in valid strings entered
    //this will need to be modified in the future
    if ([username length]==0 || [password length]==0 || [emailAddress length]==0) {
        UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"Entry error" message:@"Please enter a valid username, email, and password." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alertView show];
    }
    
    
}

- (IBAction)goToLogin:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

@end

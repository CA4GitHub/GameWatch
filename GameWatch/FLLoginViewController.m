//
//  FLLoginViewController.m
//  GameWatch
//
//  Created by Fredrick Lawton on 8/28/14.
//  Copyright (c) 2014 Fredrick A. Lawton. All rights reserved.
//

#import "FLLoginViewController.h"

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


#pragma mark - IBActions
- (IBAction)logIn:(id)sender {
    NSLog(@"Log In");
}
- (IBAction)signUp:(id)sender {
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

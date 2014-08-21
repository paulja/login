//
//  LoginController.m
//  login
//
//  Created by Paul Jackson on 21/08/2014.
//  Copyright (c) 2014 Paul Jackson. All rights reserved.
//

#import "LoginController.h"

@interface LoginController ()

@property (weak, nonatomic) IBOutlet UITextField *emailText;
@property (weak, nonatomic) IBOutlet UITextField *passwordText;

- (IBAction)login:(id)sender;

@end

@implementation LoginController

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    // Set focus to the email text view
    [self.emailText becomeFirstResponder];
}

- (IBAction)exitToLogin:(UIStoryboardSegue *)segue
{
    // Add logic to log user out
    self.emailText.text = self.passwordText.text = nil;
}

- (IBAction)login:(id)sender
{
    // User validation, if success call the success segue
    if (self.emailText.text.length != 0 &&
        self.passwordText.text.length != 0) {
        
        // Render success
        [self performSegueWithIdentifier:@"loginSuccessSegue" sender:self];
    } else {
        // Login failed—inform the user
        __block UIAlertView *alert =
            [[UIAlertView alloc]
                 initWithTitle:@"Login Failed"
                 message:@"Either your email or password is incorrect. Please try again."
                 delegate:nil
                 cancelButtonTitle:nil
                 otherButtonTitles:nil];
        [alert show];

        // Hide the alert
        double delayInSeconds = 3;
        dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, delayInSeconds * NSEC_PER_SEC);
        dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
            [alert dismissWithClickedButtonIndex:0 animated:YES];
        });
    }
}

@end

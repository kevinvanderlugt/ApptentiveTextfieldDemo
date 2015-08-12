//
//  ViewController.m
//  appentive-test
//
//  Created by Kevin VanderLugt on 8/11/15.
//  Copyright (c) 2015 Kevin VanderLugt. All rights reserved.
//

#import "ViewController.h"
#import "ATConnect.h"

@interface ViewController ()

@property BOOL engaged;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.engaged = FALSE;
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
}

- (void)keyboardWillShow:(NSNotification *)notification {
    if(!self.engaged) {
        [[ATConnect sharedConnection] engage:@"init" fromViewController:self];
        self.engaged = TRUE;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

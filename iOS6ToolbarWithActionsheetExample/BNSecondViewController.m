//
//  BNSecondViewController.m
//  iOS6ToolbarWithActionsheetExample
//
//  Created by Tatsuya Tobioka on 12/11/19.
//  Copyright (c) 2012年 Tatsuya Tobioka. All rights reserved.
//

#import "BNSecondViewController.h"

@interface BNSecondViewController () <UIActionSheetDelegate>

@end

@implementation BNSecondViewController

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
    
    // Self
    self.view.backgroundColor = [UIColor whiteColor];
    
    // Toolbar
    UIBarButtonItem *dummyItem = [[UIBarButtonItem alloc] initWithTitle:@"Dummy" style:UIBarButtonItemStyleBordered target:nil action:nil];
    self.toolbarItems = @[dummyItem];
    [dummyItem release];
    
    // Show ActionSheet
    UIButton *showButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [showButton setTitle:@"Show" forState:UIControlStateNormal];
    showButton.frame = CGRectMake(5, 5, 0, 0);
    [showButton sizeToFit];
    [showButton addTarget:self action:@selector(showAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:showButton];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    self.navigationController.toolbarHidden = NO;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

# pragma mark - Control Actions

- (void)showAction:(id)sender {
    
    UIActionSheet *actionSheet = [[UIActionSheet alloc] init];
    actionSheet.delegate = self;
    
    [actionSheet addButtonWithTitle:@"clickedButtonAtIndex"];
    [actionSheet addButtonWithTitle:@"willDismissWithButtonIndex"];
    [actionSheet addButtonWithTitle:@"didDismissWithButtonIndex"];
    [actionSheet addButtonWithTitle:@"Cancel"];
    [actionSheet setCancelButtonIndex:3];
    
    [actionSheet showFromToolbar:self.navigationController.toolbar];
    
    [actionSheet release];
}

# pragma mark - UIActionSheetDelegate

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
    
    switch (buttonIndex) {
        case 0:
            [self.navigationController popViewControllerAnimated:YES];
            break;
    }
    
}

- (void)actionSheet:(UIActionSheet *)actionSheet willDismissWithButtonIndex:(NSInteger)buttonIndex {
    switch (buttonIndex) {
        case 1:
            [self.navigationController popViewControllerAnimated:YES];
            break;
    }
}

- (void)actionSheet:(UIActionSheet *)actionSheet didDismissWithButtonIndex:(NSInteger)buttonIndex {
    switch (buttonIndex) {
        case 2:
            [self.navigationController popViewControllerAnimated:YES];
            break;
    }
}



@end

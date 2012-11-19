//
//  BNViewController.m
//  iOS6ToolbarWithActionsheetExample
//
//  Created by Tatsuya Tobioka on 12/11/19.
//  Copyright (c) 2012年 Tatsuya Tobioka. All rights reserved.
//

#import "BNViewController.h"

#import "BNSecondViewController.h"

@interface BNViewController ()

@property (nonatomic, retain) BNSecondViewController *secondViewController;

@end

@implementation BNViewController

- (void)dealloc {
    [_secondViewController release];
    
    [super dealloc];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    // Self
    self.view.backgroundColor = [UIColor whiteColor];

    // Init SecondController
    BNSecondViewController *secondViewController = [[BNSecondViewController alloc] init];
    self.secondViewController = secondViewController;
    [secondViewController release];
    
    // Second
    UIButton *secondButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [secondButton setTitle:@"Second View" forState:UIControlStateNormal];
    secondButton.frame = CGRectMake(5, 5, 0, 0);
    [secondButton sizeToFit];
    [secondButton addTarget:self action:@selector(secondAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:secondButton];    
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    self.navigationController.toolbarHidden = YES;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

# pragma mark - Control Actions

- (void)secondAction:(id)sender {
    [self.navigationController pushViewController:_secondViewController animated:YES];    
}

@end

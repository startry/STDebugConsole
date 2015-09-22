//
//  STDebugConsoleViewController.m
//  STDebugConsoleExample
//
//  Created by chenxing.cx on 15/9/22.
//  Copyright © 2015 Startry. All rights reserved.
//

#import "STDebugConsoleViewController.h"
#import "STDebugTableView.h"
#import "STDebugNavView.h"
#import "STDebugCache.h"

static CGFloat const kNavViewHeight = 64.0f;

@interface STDebugConsoleViewController()

@property (nonatomic, strong) STDebugNavView   *debugNavView;
@property (nonatomic, strong) STDebugTableView *debugTableView;

@end

@implementation STDebugConsoleViewController

- (void)viewDidLoad{
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    
    _debugNavView   = [[STDebugNavView alloc] init];
    _debugTableView = [[STDebugTableView alloc] init];
    
    UIView *tbHeaderView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 0, kNavViewHeight)];
    _debugTableView.tableHeaderView = tbHeaderView;
    
    [self.view addSubview:_debugTableView];
    [self.view addSubview:_debugNavView];
    
    [_debugNavView.backButton addTarget:self action:@selector(didBackButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSArray *logs = [[STDebugCache sharedInstance] logFileContent];
        dispatch_async(dispatch_get_main_queue(), ^{
            _debugTableView.logs = logs;
            [_debugTableView reloadData];
            
            [_debugTableView scrollToBottomAnimated:YES];
        });
    });
}

- (void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
    
    CGFloat statusHeight = 20.0f;
    CGFloat navHeight = kNavViewHeight;
    CGRect bounds = self.view.bounds;
    
    [_debugNavView setFrame:CGRectMake(0, 0, bounds.size.width, navHeight)];
    [_debugTableView setFrame:CGRectMake(0, statusHeight, bounds.size.width, bounds.size.height - statusHeight)];
}

#pragma mark - Button Event
- (void) didBackButtonClicked:(id)sender{
    [self dismissViewControllerAnimated:YES completion:nil];
}


@end

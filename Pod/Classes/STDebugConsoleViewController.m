//
//  STDebugConsoleViewController.m
//  STDebugConsoleExample
//
//  Created by chenxing.cx on 15/9/22.
//  Copyright © 2015 Startry. All rights reserved.
//

#import "STDebugConsoleViewController.h"
#import "STDebugCell.h"
#import "STDebugNavView.h"
#import "STDebugCache.h"

static CGFloat const kNavViewHeight = 64.0f;

@interface STDebugConsoleViewController()<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) STDebugNavView   *debugNavView;
@property (nonatomic, strong) UITableView *debugTableView;

@property (nonatomic, strong) NSArray *logs;

@end

static NSString *const kCellIdentify = @"STDebugViewCellIdentfity";

@implementation STDebugConsoleViewController

- (void)viewDidLoad{
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    
    _debugNavView   = [[STDebugNavView alloc] init];
    _debugTableView = [[UITableView alloc] init];
    
    UIView *tbHeaderView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 0, kNavViewHeight)];
    _debugTableView.tableHeaderView = tbHeaderView;
    
    [_debugTableView registerClass:[STDebugCell class] forCellReuseIdentifier:kCellIdentify];
    [_debugTableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    [_debugTableView setDataSource:self];
    [_debugTableView setDelegate:self];
    
    [self.view addSubview:_debugTableView];
    [self.view addSubview:_debugNavView];
    
    [_debugNavView.backButton addTarget:self action:@selector(didBackButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSArray *logs = [[STDebugCache sharedInstance] latestLogArray];
        dispatch_async(dispatch_get_main_queue(), ^{
            self.logs = logs;
            [_debugTableView reloadData];
            
            [self scrollTableViewToBottomAnimated:YES];
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

#pragma mark - Table Delegate
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    STDebugCell *cell = [tableView dequeueReusableCellWithIdentifier:kCellIdentify];
    
    NSString *log = _logs[indexPath.row];
    
    [cell showLog:log withColor:[[STDebugCache sharedInstance] colorWithLog:log]];
    
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _logs.count;
}

- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *log = _logs[indexPath.row];
    return [STDebugCell cellHeightWithLog:log frame:tableView.frame];
}

#pragma mark - Scroll Method
- (void)scrollTableViewToBottomAnimated:(BOOL)animated{
    dispatch_async(dispatch_get_main_queue(), ^{
        
        CGFloat offset = _debugTableView.contentSize.height - _debugTableView.frame.size.height;
        if (offset > 0) {
            [_debugTableView setContentOffset:CGPointMake(0, offset) animated:animated];
        }
    });
}

#pragma mark - Button Event
- (void) didBackButtonClicked:(id)sender{
    [self dismissViewControllerAnimated:YES completion:nil];
}


@end

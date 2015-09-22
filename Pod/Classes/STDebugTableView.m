//
//  STDebugTableView.m
//  STDebugConsoleExample
//
//  Created by chenxing.cx on 15/9/22.
//  Copyright © 2015 Startry. All rights reserved.
//

#import "STDebugTableView.h"

@interface STDebugTableView()<UITableViewDataSource, UITableViewDelegate>
@end

@implementation STDebugTableView

static NSString *const kCellIdentify = @"STDebugViewCellIdentfity";

- (instancetype)init{
    if (self = [super init]) {
        [self initViews];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style{
    if(self = [super initWithFrame:frame style:style]){
        [self initViews];
    }
    return self;
}

- (void) initViews{
    [self registerClass:[STDebugCell class] forCellReuseIdentifier:kCellIdentify];
    
    [self setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    
    [self setDataSource:self];
    [self setDelegate:self];
}

#pragma mark - Table Delegate
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    STDebugCell *cell = [tableView dequeueReusableCellWithIdentifier:kCellIdentify];
    
    NSString *log = _logs[indexPath.row];
    [cell showLog:log withColor:[UIColor blackColor]];
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
- (void)scrollToBottomAnimated:(BOOL)animated{
    dispatch_async(dispatch_get_main_queue(), ^{
        [self setContentOffset:CGPointMake(0, self.contentSize.height - self.frame.size.height) animated:animated];
    });   
}

@end

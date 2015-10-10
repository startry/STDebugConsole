//
//  STDebugNavView.m
//  STDebugConsoleExample
//
//  Created by chenxing.cx on 15/9/22.
//  Copyright © 2015 Startry. All rights reserved.
//

#import "STDebugNavView.h"

@implementation STDebugNavView

- (instancetype)init{
    if (self = [super init]) {
        [self initViews];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self initViews];
    }
    return self;
}

- (void) initViews{
    [self setBackgroundColor:[UIColor colorWithWhite:0.95f alpha:0.95f]];
    
    if (_titleLabel) {
        return;
    }
    
    UIFont *titleFont = [UIFont boldSystemFontOfSize:20.0f];
    UIFont *btnFont = [UIFont systemFontOfSize:14.0f];
    
    _titleLabel = [[UILabel alloc] init];
    [_titleLabel setFont:titleFont];
    [_titleLabel setTextColor:[UIColor blackColor]];
    [_titleLabel setTextAlignment:NSTextAlignmentCenter];
    
    _backButton = [[UIButton alloc] init];
    [_backButton.titleLabel setFont:btnFont];
    [_backButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    _filterButton = [[UIButton alloc] init];
    [_filterButton.titleLabel setFont:btnFont];
    [_filterButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    [self addSubview:_titleLabel];
    [self addSubview:_backButton];
    [self addSubview:_filterButton];

    [_titleLabel setText:@"Console"];
    [_backButton setTitle:@"Back" forState:UIControlStateNormal];
    [_filterButton setTitle:@"Filter" forState:UIControlStateNormal];
}

- (void)layoutSubviews{
    [super layoutSubviews];
    
    CGFloat statusHeight = 20.0f;
    CGFloat marginLeft = 10.0f;
    CGFloat titleMarginLeft = 80.0f;
    CGFloat btnWidth = 40.0f;
    CGFloat btnHeight = self.bounds.size.height - statusHeight;
    
    [_backButton setFrame:CGRectMake(marginLeft, statusHeight, btnWidth, btnHeight)];
    [_filterButton setFrame:CGRectMake(self.bounds.size.width - marginLeft - btnWidth, statusHeight, btnWidth, btnHeight)];
    
    [_titleLabel setFrame:CGRectMake(titleMarginLeft, statusHeight, self.bounds.size.width - 2 * titleMarginLeft, self.bounds.size.height - statusHeight)];
}

@end

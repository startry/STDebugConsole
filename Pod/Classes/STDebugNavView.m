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
    
    _titleLabel = [[UILabel alloc] init];
    [_titleLabel setFont:[UIFont boldSystemFontOfSize:20.0f]];
    [_titleLabel setTextColor:[UIColor blackColor]];
    [_titleLabel setTextAlignment:NSTextAlignmentCenter];
    
    _backButton = [[UIButton alloc] init];
    [_backButton.titleLabel setFont:[UIFont systemFontOfSize:14.0f]];
    [_backButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    [self addSubview:_titleLabel];
    [self addSubview:_backButton];

    [_titleLabel setText:@"Console"];
    [_backButton setTitle:@"Back" forState:UIControlStateNormal];
}

- (void)layoutSubviews{
    [super layoutSubviews];
    
    CGFloat statusHeight = 20.0f;
    CGFloat marginLeft = 10.0f;
    CGFloat titleMarginLeft = 80.0f;
    
    [_backButton setFrame:CGRectMake(marginLeft, statusHeight, 40.0f, self.bounds.size.height - statusHeight)];
    [_titleLabel setFrame:CGRectMake(titleMarginLeft, statusHeight, self.bounds.size.width - 2 * titleMarginLeft, self.bounds.size.height - statusHeight)];
}

@end

//
//  STDebugFilterView.m
//  STDebugConsoleExample
//
//  Created by chenxing.cx on 15/10/10.
//  Copyright © 2015 Startry. All rights reserved.
//

#import "STDebugFilterView.h"

@interface STDebugFilterView()

@property (nonatomic, strong) UIView      *inputBgView;

@end

@implementation STDebugFilterView

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self setBackgroundColor:[UIColor colorWithWhite:1.0f alpha:0.7]];
        
        _inputBgView = [[UIView alloc] init];
        [_inputBgView setBackgroundColor:[UIColor colorWithWhite:0.95f alpha:0.8f]];
        
        _filterTF = [[UITextField alloc] init];
        [_filterTF setBackgroundColor:[UIColor whiteColor]];
        
        [self addSubview:_inputBgView];
        [self addSubview:_filterTF];
        
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(didBackgroudTaped:)];
        [self addGestureRecognizer:tap];
    }
    return self;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    
    CGFloat marginLeft = 15.0f;
    CGFloat marginTop = 8.0f;
    
    [_inputBgView setFrame:CGRectMake(0, 0, self.bounds.size.width, 50.0f)];
    [_filterTF setFrame:CGRectMake(marginLeft, marginTop, self.bounds.size.width - 2 * marginLeft, 32.0f)];
}

#pragma mark - Events
- (void) didBackgroudTaped:(id)sender{
    [self setHidden:YES];
}

@end

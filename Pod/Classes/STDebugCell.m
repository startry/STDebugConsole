//
//  STDebugCell.m
//  STDebugConsoleExample
//
//  Created by chenxing.cx on 15/9/22.
//  Copyright © 2015年 Startry. All rights reserved.
//

#import "STDebugCell.h"

@interface STDebugCell()

@property (nonatomic, strong) UILabel *debugLabel;

@end

static CGFloat const kFontSize   = 12.0f;
static CGFloat const kMarginLeft = 15.0f;
static CGFloat const kMarginTop  = 2.0f;

@implementation STDebugCell

- (instancetype)init{
    if (self = [super init]) {
        [self initViews];
    }
    return self;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self initViews];
    }
    return self;
}

- (void)awakeFromNib{
    [super awakeFromNib];
    [self initViews];
}

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self initViews];
    }
    return self;
}

- (void) initViews{
    if (_debugLabel) {
        return;
    }
    
    _debugLabel = [[UILabel alloc] init];
    [_debugLabel setTextColor:[UIColor blackColor]];
    [_debugLabel setNumberOfLines:0];
    [_debugLabel setFont:[UIFont systemFontOfSize:kFontSize]];
    
    [self addSubview:_debugLabel];
}

- (void)layoutSubviews{
    [super layoutSubviews];
    
    [_debugLabel setFrame:CGRectMake(kMarginLeft,
                                     kMarginTop,
                                     self.bounds.size.width - 2 * kMarginLeft,
                                     self.bounds.size.height - 2 * kMarginTop)];
}

- (void)showLog:(NSString *)log withColor:(UIColor *)color{
    [_debugLabel setText:log];
    
    if (color) {
        [_debugLabel setTextColor:color];
    }
}

#pragma mark - Height Calculate Method
+ (CGFloat) cellHeightWithLog:(NSString *) log frame:(CGRect) cellFrame{
    
    CGRect cellRect = [log boundingRectWithSize:CGSizeMake(cellFrame.size.width - 2 * kMarginLeft, 1000) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName: [UIFont systemFontOfSize:kFontSize]} context:nil];
    cellRect.size.height = ceilf(cellRect.size.height);
    
    CGFloat cellHeight = cellRect.size.height + 2 * kMarginTop;
    
    return cellHeight > 20.0f? cellHeight: 20.0f;
}

@end

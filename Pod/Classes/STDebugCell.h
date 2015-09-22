//
//  STDebugCell.h
//  STDebugConsoleExample
//
//  Created by chenxing.cx on 15/9/22.
//  Copyright © 2015 Startry. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface STDebugCell : UITableViewCell

- (void) showLog:(NSString *) log withColor:(UIColor *) color;

+ (CGFloat) cellHeightWithLog:(NSString *) log frame:(CGRect) cellFrame;

@end

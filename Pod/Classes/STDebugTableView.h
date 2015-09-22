//
//  STDebugTableView.h
//  STDebugConsoleExample
//
//  Created by chenxing.cx on 15/9/22.
//  Copyright © 2015 Startry. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "STDebugCell.h"

@interface STDebugTableView : UITableView

@property (nonatomic, strong) NSArray *logs;

- (void) scrollToBottomAnimated:(BOOL) animated;

@end

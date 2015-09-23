//
//  STDebugConsole.h
//  STDebugConsoleExample
//
//  Created by chenxing.cx on 15/9/22.
//  Copyright © 2015 Startry. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "STDebugConsoleDefine.h"

@interface STDebugConsole : NSObject

+ (void) setModel:(STDebugConsoleModel) debugMode;

+ (void) setColor:(UIColor *) color withSearchKey:(NSString *) searchKey;

+ (void) setDefaultColor:(UIColor *) defaultColor;

@end

//
//  STDebugConsole.m
//  STDebugConsoleExample
//
//  Created by chenxing.cx on 15/9/22.
//  Copyright © 2015 Startry. All rights reserved.
//

#import "STDebugConsole.h"
#import "STDebugCache.h"
#import "STDebugConsoleVIewController.h"

@implementation STDebugConsole

+ (void)setModel:(STDebugConsoleModel)debugMode{
    if (debugMode == STDebugConsoleModelRedirect) {
        [[STDebugCache sharedInstance] redirectNSLogToFileSystem];
    }
}

+ (void)setColor:(id)color withSearchKey:(NSString *)searchKey{
    [[STDebugCache sharedInstance] setColor:color withSearchKey:searchKey];
}

+ (void)setDefaultColor:(UIColor *)defaultColor{
    
}

@end

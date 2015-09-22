//
//  STDebugConsole.m
//  STDebugConsoleExample
//
//  Created by chenxing.cx on 15/9/22.
//  Copyright © 2015年 Startry. All rights reserved.
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

+ (void)showorCloseConsoleAnimated:(BOOL)animation{
    UIViewController *currentVC = [UIApplication sharedApplication].keyWindow.rootViewController;
    UIViewController *presentedVC = [UIApplication sharedApplication].keyWindow.rootViewController.presentedViewController;
    
    if ([presentedVC isKindOfClass:[STDebugConsoleViewController class]]) {
        [presentedVC dismissViewControllerAnimated:YES completion:nil];
    }else{
        STDebugConsoleViewController *consoleVC = [[STDebugConsoleViewController alloc] init];
        [currentVC presentViewController:consoleVC animated:animation completion:nil];
    }
}

@end

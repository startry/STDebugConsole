//
//  STDebugCache.h
//  STDebugConsoleExample
//
//  Created by chenxing.cx on 15/9/22.
//  Copyright © 2015 Startry. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface STDebugCache : NSObject

@property (nonatomic, strong) UIColor *defaultColor;
@property (nonatomic, strong) NSString *filterKey;

+ (instancetype) sharedInstance;

/**
 *  Redirect NSLog Info from Console To File System
 */
- (void) redirectNSLogToFileSystem;

- (NSArray *) latestLogArray;

#pragma mark - Color And Search Key
- (void) setColor:(UIColor *) color withSearchKey:(NSString *) searchKey;

- (UIColor *) colorWithLog:(NSString *) log;


@end

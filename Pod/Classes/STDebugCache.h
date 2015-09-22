//
//  STDebugCache.h
//  STDebugConsoleExample
//
//  Created by chenxing.cx on 15/9/22.
//  Copyright © 2015年 Startry. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface STDebugCache : NSObject

+ (instancetype) sharedInstance;

- (NSString *) logFilePath;
- (NSArray *) logFileContent;

- (void) redirectNSLogToFileSystem;

@end

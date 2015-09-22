//
//  STDebugCache.m
//  STDebugConsoleExample
//
//  Created by chenxing.cx on 15/9/22.
//  Copyright © 2015 Startry. All rights reserved.
//

#import "STDebugCache.h"

@implementation STDebugCache

+ (instancetype)sharedInstance {
    static dispatch_once_t pred = 0;
    static STDebugCache *_sharedObject = nil;
    dispatch_once(&pred, ^{
        _sharedObject = [[self alloc] init];
    });
    return _sharedObject;
}

- (NSString *)logFilePath{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,
                                                         NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString *logPath = [documentsDirectory stringByAppendingPathComponent:@"st_debug_console.log"];
    
    return logPath;
}

- (void) redirectNSLogToFileSystem{
    freopen([[self logFilePath] fileSystemRepresentation],"a+",stderr);
}

- (NSArray *) logFileContent{
    // read everything from text
    NSString* fileContents =
    [NSString stringWithContentsOfFile:[self logFilePath]
                              encoding:NSUTF8StringEncoding error:nil];
    
    NSArray* allLinedStrings =
    [fileContents componentsSeparatedByCharactersInSet:
     [NSCharacterSet newlineCharacterSet]];
    
    return allLinedStrings;
}

@end

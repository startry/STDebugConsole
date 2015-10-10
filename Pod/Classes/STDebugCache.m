//
//  STDebugCache.m
//  STDebugConsoleExample
//
//  Created by chenxing.cx on 15/9/22.
//  Copyright © 2015 Startry. All rights reserved.
//

#import "STDebugCache.h"

@implementation STDebugCache{
    UIColor *_defaultColor;
    NSMutableDictionary *_muteSearchKeyDict;
}

+ (instancetype)sharedInstance {
    static dispatch_once_t pred = 0;
    static STDebugCache *_sharedObject = nil;
    dispatch_once(&pred, ^{
        _sharedObject = [[self alloc] init];
    });
    return _sharedObject;
}

- (instancetype)init{
    if (self = [super init]) {
        _muteSearchKeyDict = [NSMutableDictionary dictionary];
        [self initDefaultConfigs];
    }
    return self;
}

- (void) initDefaultConfigs{
    [self setColor:[UIColor blueColor] withSearchKey:@"[Debug]"];
    [self setColor:[UIColor orangeColor] withSearchKey:@"[Warning]"];
    [self setColor:[UIColor redColor] withSearchKey:@"[Error]"];
    
    _defaultColor = [UIColor blackColor];
}

#pragma mark - Read An Write Log File

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

- (NSArray *) latestLogArray{
    // Read All Content From File
    
    NSString* fileContents =
    [NSString stringWithContentsOfFile:[self logFilePath]
                              encoding:NSUTF8StringEncoding error:nil];
    
    NSArray* allLinedStrings =
    [fileContents componentsSeparatedByCharactersInSet:
     [NSCharacterSet newlineCharacterSet]];
    
    // exclude lines doesn't contains filter key
    NSString *filterKey = [_filterKey copy];
    if (filterKey) {
        NSMutableArray *keepArray = [NSMutableArray array];
        for (int i = 0; i < allLinedStrings.count; i++) {
            NSString *lineStr = allLinedStrings[i];
            if (NSNotFound != [lineStr rangeOfString:filterKey options:NSCaseInsensitiveSearch].location) {
                [keepArray addObject:lineStr];
            }
        }
        allLinedStrings = [keepArray copy];
    }
    
    NSUInteger count = allLinedStrings.count;
    if (count > 500) {
        return [allLinedStrings subarrayWithRange:NSMakeRange(count - 500, 500)];
    }
    
    return allLinedStrings;
}

#pragma mark - Read And Write Search Key
- (void)setColor:(UIColor *)color withSearchKey:(NSString *)searchKey{
    _muteSearchKeyDict[searchKey] = color;
}

- (UIColor *)colorBySearchKey:(NSString *)searchKey{
    if (!searchKey) {
        return [UIColor blackColor];
    }
    
    UIColor *color = _muteSearchKeyDict[searchKey];
    if (!color) {
        color = [UIColor blackColor];
    }
    
    return color;
}

- (UIColor *)colorWithLog:(NSString *)log{
    NSArray *allSearchKeys = [_muteSearchKeyDict allKeys];
    for (int i = 0; i < allSearchKeys.count; i++) {
        NSString *key = allSearchKeys[i];
        if(NSNotFound !=[log rangeOfString:key options:NSCaseInsensitiveSearch].location){
            return [self colorBySearchKey:key];
        }
    }
    return [self defaultColor];
}

#pragma mark - Getter And Setter
- (UIColor *)defaultColor{
    if (!_defaultColor) {
        _defaultColor = [UIColor blackColor];
    }
    return _defaultColor;
}

- (void)setDefaultColor:(UIColor *)defaultColor{
    if (defaultColor == nil || ![defaultColor isKindOfClass:[UIColor class]]) {
        return;
    }
    _defaultColor = defaultColor;
}

@end

//
//  STViewController.m
//  STDebugConsole
//
//  Created by chenxing.cx on 09/22/2015.
//  Copyright (c) 2015 chenxing.cx. All rights reserved.
//

#import "STViewController.h"
#import <STDebugConsole/STDebugConsole.h>
#import <STDebugConsole/STDebugConsoleViewController.h>

@interface STViewController ()

@end

@implementation STViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view setBackgroundColor:[UIColor colorWithWhite:0.9 alpha:1.0]];
    
    CGRect bounds = self.view.bounds;
    
    for (int i = 0; i < 5; i++) {
        UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake((bounds.size.width - 160) / 2, 60 + i * 70, 160, 40)];
        [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [btn.layer setCornerRadius:10];
        [btn.layer setMasksToBounds:YES];
        [btn.layer setBorderWidth:2.0f];
        [btn.layer setBorderColor:[[UIColor grayColor] CGColor]];
        btn.tag = i;
        [self.view addSubview:btn];
        
        if (i == 0) {
            [btn setTitle:@"show console" forState:UIControlStateNormal];
            [btn addTarget:self action:@selector(didConsoleButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
        }else{
            
            switch (i) {
                case 1:
                    [btn setTitle:@"print warning" forState:UIControlStateNormal];
                    break;
                case 2:
                    [btn setTitle:@"print error" forState:UIControlStateNormal];
                    break;
                case 3:
                    [btn setTitle:@"print debug" forState:UIControlStateNormal];
                    break;
                default:
                    [btn setTitle:[NSString stringWithFormat:@"print log %d", i] forState:UIControlStateNormal];
                    break;
            }
            
            [btn addTarget:self action:@selector(didButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
        }
    }
}

#pragma mark - Button Event
- (void) didButtonClicked:(UIButton *) btn{
    switch (btn.tag) {
        case 1:
            NSLog(@"[warning] is logging");
            break;
        case 2:
            NSLog(@"[error] is print");
            break;
        case 3:
            NSLog(@"[debug] is called");
            break;
        default:
            for (int i = 0; i < 10000; i++) {
                NSLog(@"print button tag: %ld", (long)btn.tag);
            }
            break;
    }
}

- (void) didConsoleButtonClicked:(id)sender{
    STDebugConsoleViewController *vc = [[STDebugConsoleViewController alloc] init];
    [self presentViewController:vc animated:YES completion:nil];
}

@end

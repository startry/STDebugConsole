# STDebugConsole 

STDebugConsole is an In-App debug console for your iOS Application.

STDebugConsole will focus on In-App Console Feature.

**Still Developing, and the simplest demo (tag 0.1.1) was ready.**

[![CI Status](http://img.shields.io/travis/startry/STDebugConsole.svg?style=flat)](https://travis-ci.org/startry/STDebugConsole)
[![Version](https://img.shields.io/cocoapods/v/STDebugConsole.svg?style=flat)](http://cocoapods.org/pods/STDebugConsole)
[![License](https://img.shields.io/cocoapods/l/STDebugConsole.svg?style=flat)](http://cocoapods.org/pods/STDebugConsole)
[![Platform](https://img.shields.io/cocoapods/p/STDebugConsole.svg?style=flat)](http://cocoapods.org/pods/STDebugConsole)

 <img src="https://raw.githubusercontent.com/startry/STDebugConsole/master/img/screenshot_1.png" width = "320" alt="Console in App" align=center />
 
## Usage

To run the example project, clone the repo, and run `pod install` from the Example directory first.

**step1:** Add redirect code to your aplication.

```Objective-C
[STDebugConsole setModel:STDebugConsoleModelRedirect];
```
**step2:** present STDebugConsoleViewController anywhere.

```Objective-C
STDebugConsoleViewController *consoleVC = [[STDebugConsoleViewController alloc] init];
[self presentViewController:consoleVC animated:YES completion:nil];
```

### Feature - Customize Color

You can customize color base on different searchkey. 

For Example:

``` Objective-C
[STDebugConsole setColor:[UIColor greenColor] withSearchKey:"[Info]"];
```
Also you can customize default color

``` Objective-C
[STDebugConsole setDefaultColor:[UIColor grayColor]];
```


## Requirements

iOS 7.0+

## Installation
 
 STDebugConsole is available through [CocoaPods](http://cocoapods.org). To install
 it, simply add the following line to your Podfile:
 
 ```ruby
 pod "STDebugConsole"
 ```

## License

STDebugConsole is available under the MIT license. See the LICENSE file for more info.
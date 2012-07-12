//
//  SPWKAppDelegate.h
//  DictationSwitcher
//
//  Created by Johannes Fahrenkrug on 12.07.12.
//  Copyright (c) 2012 Johannes Fahrenkrug. All rights reserved.
//
// based on https://github.com/shpakovski/Popup Thanks!

#import <Cocoa/Cocoa.h>
#import "SPWKMenubarController.h"

@interface SPWKAppDelegate : NSObject <NSApplicationDelegate>

@property (nonatomic, strong) SPWKMenubarController *menubarController;

@end

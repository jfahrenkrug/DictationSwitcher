//
//  SPWKAppDelegate.m
//  DictationSwitcher
//
//  Created by Johannes Fahrenkrug on 12.07.12.
//  Copyright (c) 2012 Johannes Fahrenkrug. All rights reserved.
//
// based on https://github.com/shpakovski/Popup Thanks!

#import "SPWKAppDelegate.h"

@implementation SPWKAppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)notification
{
    // Install icon into the menu bar
    self.menubarController = [[SPWKMenubarController alloc] init];
}

- (NSApplicationTerminateReply)applicationShouldTerminate:(NSApplication *)sender
{
    // Explicitly remove the icon from the menu bar
    self.menubarController = nil;
    return NSTerminateNow;
}

@end

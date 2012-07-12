//
//  SPWKMenubarController.h
//  DictationSwitcher
//
//  Created by Johannes Fahrenkrug on 12.07.12.
//  Copyright (c) 2012 Johannes Fahrenkrug. All rights reserved.
//
// based on https://github.com/shpakovski/Popup Thanks!


#define SPWK_STATUS_ITEM_VIEW_WIDTH 24.0

#pragma mark -

@class SPWKStatusItemView;

@interface SPWKMenubarController : NSObject

@property (nonatomic, strong, readonly) NSStatusItem *statusItem;
@property (nonatomic, strong, readonly) SPWKStatusItemView *statusItemView;
@property (nonatomic, copy) NSString *lang;

- (IBAction)toggleLang:(id)sender;

@end

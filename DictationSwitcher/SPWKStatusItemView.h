//
//  SPWKStatusItemView.h
//  DictationSwitcher
//
//  Created by Johannes Fahrenkrug on 12.07.12.
//  Copyright (c) 2012 Johannes Fahrenkrug. All rights reserved.
//
// based on https://github.com/shpakovski/Popup Thanks!

@interface SPWKStatusItemView : NSView

- (id)initWithStatusItem:(NSStatusItem *)statusItem;

@property (nonatomic, strong, readonly) NSStatusItem *statusItem;
@property (nonatomic, readonly) NSRect globalRect;
@property (nonatomic) SEL action;
@property (nonatomic, unsafe_unretained) id target;

@property (nonatomic, copy) NSString *lang;

@end

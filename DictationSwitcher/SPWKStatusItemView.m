//
//  SPWKStatusItemView.m
//  DictationSwitcher
//
//  Created by Johannes Fahrenkrug on 12.07.12.
//  Copyright (c) 2012 Johannes Fahrenkrug. All rights reserved.
//
// based on https://github.com/shpakovski/Popup Thanks!

#import "SPWKStatusItemView.h"

@implementation SPWKStatusItemView

@synthesize statusItem = _statusItem;
@synthesize action = _action;
@synthesize target = _target;
@synthesize lang = _lang;

#pragma mark -

- (id)initWithStatusItem:(NSStatusItem *)statusItem
{
    CGFloat itemWidth = [statusItem length];
    CGFloat itemHeight = [[NSStatusBar systemStatusBar] thickness];
    NSRect itemRect = NSMakeRect(0.0, 0.0, itemWidth, itemHeight);
    self = [super initWithFrame:itemRect];
    
    if (self != nil) {
        _statusItem = statusItem;
        _statusItem.view = self;
    }
    return self;
}


#pragma mark -

- (void)drawRect:(NSRect)dirtyRect
{
    NSString *shortLang = [[_lang componentsSeparatedByString:@"-"] objectAtIndex:0];
    
	[self.statusItem drawStatusBarBackgroundInRect:dirtyRect withHighlight:NO];
    NSDictionary *attributes = [NSDictionary dictionaryWithObjectsAndKeys:[NSFont systemFontOfSize:[NSFont systemFontSizeForControlSize:NSRegularControlSize]], NSFontAttributeName, nil];
    NSSize iconSize = [shortLang sizeWithAttributes:attributes];
    NSRect bounds = self.bounds;
    CGFloat iconX = roundf((NSWidth(bounds) - iconSize.width) / 2);
    CGFloat iconY = roundf((NSHeight(bounds) - iconSize.height) / 2);
    NSPoint iconPoint = NSMakePoint(iconX, iconY);
    
    [shortLang drawAtPoint:iconPoint withAttributes:attributes];
}
 

#pragma mark - Mouse tracking

- (void)mouseDown:(NSEvent *)theEvent
{
    [NSApp sendAction:self.action to:self.target from:self];
}

#pragma mark - Accessors

- (void)setLang:(NSString *)aLang
{
    _lang = aLang;
    [self setNeedsDisplay:YES];
}


#pragma mark -

- (NSRect)globalRect
{
    NSRect frame = [self frame];
    frame.origin = [self.window convertBaseToScreen:frame.origin];
    return frame;
}

@end

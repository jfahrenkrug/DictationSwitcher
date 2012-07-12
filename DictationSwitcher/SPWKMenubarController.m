//
//  SPWKMenubarController.m
//  DictationSwitcher
//
//  Created by Johannes Fahrenkrug on 12.07.12.
//  Copyright (c) 2012 Johannes Fahrenkrug. All rights reserved.
//
// based on https://github.com/shpakovski/Popup Thanks!

#import "SPWKMenubarController.h"
#import "SPWKStatusItemView.h"

@implementation SPWKMenubarController

@synthesize statusItemView = _statusItemView;

#define SPWK_PRIMARY_LANG @"en-EN"
#define SPWK_SECONDARY_LANG @"de-DE"

#pragma mark -

- (id)init
{
    self = [super init];
    if (self != nil)
    {
        // Install status item into the menu bar
        NSStatusItem *statusItem = [[NSStatusBar systemStatusBar] statusItemWithLength:SPWK_STATUS_ITEM_VIEW_WIDTH];
        _statusItemView = [[SPWKStatusItemView alloc] initWithStatusItem:statusItem];
        self.lang = [self currentSystemDictationLang];
        _statusItemView.target = self;
        _statusItemView.action = @selector(toggleLang:);
    }
    return self;
}

- (void)dealloc
{
    [[NSStatusBar systemStatusBar] removeStatusItem:self.statusItem];
}

#pragma mark -
#pragma mark Public accessors

- (NSStatusItem *)statusItem
{
    return self.statusItemView.statusItem;
}

#pragma mark -

- (NSString *)lang
{
    return self.statusItemView.lang;
}

- (void)setLang:(NSString *)aLang
{
    self.statusItemView.lang = aLang;
}

#pragma mark - Actions

- (IBAction)toggleLang:(id)sender
{
    self.lang = ([self.lang isEqualToString:SPWK_PRIMARY_LANG] ? SPWK_SECONDARY_LANG : SPWK_PRIMARY_LANG);
    
    [self runScript:@"/usr/bin/defaults" arguments:@[@"write", @"com.apple.speech.recognition.AppleSpeechRecognition.prefs", @"DictationIMLocaleIdentifier", self.lang]];
        
    // THIS IS A VERY UGLY HACK! THE Dictation process needs to be terminated to pick up the changes...
    // There MUST be a more elegant way!
    [self runScript:@"/usr/bin/pkill" arguments:@[@"-9", @"Dictation"]];
}


// thanks http://stackoverflow.com/questions/412562/execute-a-terminal-command-from-a-cocoa-app
- (NSString *)runScript:(NSString *)scriptName arguments:(NSArray *)arguments
{
    NSTask *task;
    task = [[NSTask alloc] init];
    [task setLaunchPath:scriptName];
    
    [task setArguments:arguments];
    
    NSPipe *pipe;
    pipe = [NSPipe pipe];
    [task setStandardOutput: pipe];
    
    NSFileHandle *file;
    file = [pipe fileHandleForReading];
    
    [task launch];
    
    NSData *data;
    data = [file readDataToEndOfFile];
    
    NSString *result;
    result = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
   
    return result;
}

- (NSString *)currentSystemDictationLang
{
    NSString *res = [self runScript:@"/usr/bin/defaults" arguments:@[@"read", @"com.apple.speech.recognition.AppleSpeechRecognition.prefs", @"DictationIMLocaleIdentifier"]];
    
    if (!res || [res length] > 6) {
        res = SPWK_PRIMARY_LANG;
    }
    
    return res;
}

@end

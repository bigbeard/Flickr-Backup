//
//  AppDelegate.h
//  Flickr Backup
//
//  Created by Ian Cliffe on 11/09/2013.
//  Copyright (c) 2013 Ian Cliffe. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface AppDelegate : NSObject <NSApplicationDelegate>

@property (assign) IBOutlet NSWindow *window;

- (IBAction)ClickButton:(NSButtonCell *)sender;

- (NSDictionary *)executeFlickrFetch:(NSString *)query;

- (NSString*)findPersonIdByUsername:(NSString *)username;

@property (weak) IBOutlet NSTextField *personIdLabel;

@end

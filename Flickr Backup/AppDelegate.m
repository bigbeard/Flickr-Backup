//
//  AppDelegate.m
//  Flickr Backup
//
//  Created by Ian Cliffe on 11/09/2013.
//  Copyright (c) 2013 Ian Cliffe. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    // Insert code here to initialize your application
}

- (IBAction)ClickButton:(NSButtonCell *)sender {
    NSString *username = @"bigbeard100";
    NSString *userId = [self findPersonIdByUsername: username];
    NSLog(@"userId: %@", userId);
    
    [[self personIdLabel] setStringValue: [NSString stringWithFormat: @"%@ : %@", username, userId]];
}

- (NSString*)findPersonIdByUsername:(NSString *)username
{
    NSString *request=[NSString stringWithFormat:@"http://ycpi.api.flickr.com/services/rest/?method=flickr.people.findByUsername&username=%@", username];
    
    NSDictionary *jsonArray = [self executeFlickrFetch: request];
    NSString *userId = [[jsonArray objectForKey:@"user"] objectForKey: @"nsid"];
    return userId;
}

- (NSDictionary *)executeFlickrFetch:(NSString *)query
{
    query = [NSString stringWithFormat:@"%@&format=json&nojsoncallback=1&api_key=%@", query, @"5f62954a10390b2fae2fcb6c06c12120"];
    query = [query stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    
    NSLog(@"request=%@", query);
    NSData *jsonData = [[NSString stringWithContentsOfURL:[NSURL URLWithString:query] encoding:NSUTF8StringEncoding error:nil] dataUsingEncoding:NSUTF8StringEncoding];
    
    NSLog(@"response=%@", jsonData);
    
    NSError *error = nil;
    NSDictionary *data = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers|NSJSONReadingMutableLeaves error:&error];
    NSLog(@"data=%@", data.description);
    
    return data;
}
@end

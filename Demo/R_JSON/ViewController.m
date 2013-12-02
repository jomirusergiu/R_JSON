//
//  ViewController.m
//  R_JSON
//
//  Created by RocKK on 12/2/13.
//  Copyright (c) 2013 RocKK.
//  All rights reserved.
//
//  Redistribution and use in source and binary forms are permitted
//  provided that the above copyright notice and this paragraph are
//  duplicated in all such forms and that any documentation,
//  advertising materials, and other materials related to such
//  distribution and use acknowledge that the software was developed
//  by the RocKK.  The name of the
//  RocKK may not be used to endorse or promote products derived
//  from this software without specific prior written permission.
//  THIS SOFTWARE IS PROVIDED ``AS IS'' AND WITHOUT ANY EXPRESS OR
//  IMPLIED WARRANTIES, INCLUDING, WITHOUT LIMITATION, THE IMPLIED
//  WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE.

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //alloc R_JSON
    R_JSON *json = [R_JSON new];
    
    //creating an address string for this example, in your project u will not need this.
    //you may use your real address such as http://
    NSURL *addressURL = [[NSBundle mainBundle] URLForResource:@"jsonFile" withExtension:@".json"];
    NSString *addressString = [addressURL absoluteString];
    
    //fetch json from address
    [json fetchJSON_fromAddress:addressString];

    // assign delegate
    json.delegate = self;
}

-(void)recieveJSON:(NSObject*)json
{
    //get contents of JSON no matter wether it has an array or dictionary structure
    NSLog(@"Whole JSON content - %@", json);
    
    //if json is a dictionary create jsonDict
    NSMutableDictionary *jsonDict = nil;
    if([json isKindOfClass:[NSMutableDictionary class]])
        jsonDict = (NSMutableDictionary *)json;
    
    //if json is an array create jsonArray
    NSMutableArray *jsonArray = nil;
    if([json isKindOfClass:[NSMutableArray class]])
        jsonArray = (NSMutableArray *)json;
    
    //since in our case json is an array we'll go through all elements by index
    //if your json has dictionary structure just get your element by key
    //also if it has inner elements do it analogically
    for (int i=0; i<[jsonArray count]; i++) {
        NSLog(@"Object at index %d is - %@", i, [jsonArray objectAtIndex:i]);
    }

    //turn off the network indicator in the status bar
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
}

@end

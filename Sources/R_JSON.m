//
//  R_JSON.m
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

#import "R_JSON.h"

@implementation R_JSON

-(void)fetchJSON_fromAddress:(NSString*)address
{
    //show the user that the app is working
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:YES];
    
    //execute this block of code in the background
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        
        //create json url from address string
        NSURL* jsonURL = [NSURL URLWithString:address];
        
        //fetch data from the URL
        NSData* jsonData = [NSData dataWithContentsOfURL:jsonURL];

        //if data was fetched - try to parse it and pass it through delegate
        if (jsonData){
             NSObject* json = [NSJSONSerialization JSONObjectWithData:jsonData options:kNilOptions error:nil];
            [_delegate recieveJSON:json];
        }
        else
             NSLog(@"Failed to get JSON from address");
        
    });
}


-(void)dealloc
{
    // set the delegate to nil
    _delegate = nil;
}


@end

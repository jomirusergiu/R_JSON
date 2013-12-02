//
//  R_JSON.h
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

#import <Foundation/Foundation.h>

// declare our class
@class R_JSON;

// define the protocol for the delegate
@protocol R_JSONDelegate

// define protocol functions that can be used in any class using this delegate
-(void)recieveJSON:(NSObject*)json;

@end

@interface R_JSON : NSObject

// define public functions
-(void)fetchJSON_fromAddress:(NSString*)address;

// define delegate property
@property (nonatomic, assign) id  delegate;

@end

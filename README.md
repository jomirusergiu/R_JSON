R_JSON
=================

R_JSON is a small class for asynchronous fetching JSON data based on NSJSONSerialization algorithm.

Usage
=============

ViewController.h
-------------
```Objective-C
//assign R_JSONDelegate to controller
@interface ViewController : UIViewController<R_JSONDelegate>
```

ViewController.m
-------------
```Objective-C
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //alloc R_JSON
    R_JSON *json = [R_JSON new];
    
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
    
    //if your json has an array structure you can get your elements by index
    //if your json has a dictionary structure just get your elements by key
    //also if it has inner elements do it analogically

    //turn off the network indicator in the status bar
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
}
```

License
--------

This code is under the BSD license.

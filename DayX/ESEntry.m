//
//  ESEntry.m
//  Entries
//
//  Created by Caleb Hicks on 5/31/14.
//  Copyright (c) 2014 DevMountain. All rights reserved.
//

#import "ESEntry.h"

static NSString * const titleKey = @"title";
static NSString * const entryKey = @"entry";
static NSString * const timeKey = @"timestamp";



@implementation ESEntry

- (NSDictionary *)entryDictionary{
    
    NSMutableDictionary *entryDictionary = [[NSMutableDictionary alloc]init];
    
    if (self.title) {
        [entryDictionary setValue:self.title forKeyPath:titleKey];
    }
    
    if (self.entry){
        [entryDictionary setValue:self.entry forKeyPath:entryKey];

    }
    
    if (self.timeStamp){
    [entryDictionary setValue:self.timeStamp forKeyPath:timeKey];
    }
    
    return entryDictionary;
}


- (id)initWithDictionary:(NSDictionary *)dictionary{
    self = [super init];
    if (self) {
        self.title = dictionary[titleKey];
        self.entry = dictionary[entryKey];
        self.timeStamp = dictionary[timeKey];
    }
    return self;
}

@end

//
//  ESEntryController.h
//  Entries
//
//  Created by Caleb Hicks on 5/31/14.
//  Copyright (c) 2014 DevMountain. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ESEntry.h"

@interface ESEntryController : NSObject

@property (strong, nonatomic, readonly) NSArray *entries;

+ (ESEntryController *)sharedInstance;

-(void)addEntry:(ESEntry *) entry;

-(void)removeEntry:(ESEntry *)entry;

-(void)loadFromDefaults;


@end

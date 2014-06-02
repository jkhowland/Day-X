//
//  ESEntryController.m
//  Entries
//
//  Created by Caleb Hicks on 5/31/14.
//  Copyright (c) 2014 DevMountain. All rights reserved.
//

#import "ESEntryController.h"
#import "ESEntry.h"

@interface ESEntryController()

@property (strong, nonatomic) NSArray *entries;

@end

static NSString * const entryListKey = @"entryList";

@implementation ESEntryController

+ (ESEntryController *)sharedInstance {
    static ESEntryController *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[ESEntryController alloc] init];
        
        [sharedInstance loadFromDefaults];
    });
    return sharedInstance;
}

- (void)setEntries:(NSArray *)entries{
    _entries = entries;
    
    [self synchronize];
    
}

- (void)synchronize{
    NSMutableArray *entryDictionaries = [NSMutableArray new];
    for (ESEntry *entry in self.entries) {
        [entryDictionaries addObject:[entry entryDictionary]];
    }
    
    [[NSUserDefaults standardUserDefaults] setObject:entryDictionaries forKey:entryListKey];
    [[NSUserDefaults standardUserDefaults] synchronize];
        
}

- (void)addEntry:(ESEntry *) entry{
    NSMutableArray *newArray = [NSMutableArray arrayWithArray:self.entries];
    [newArray addObject:entry];
    self.entries = newArray;
    
}

- (void)removeEntry:(ESEntry *)entry{
    NSMutableArray *newArray = [NSMutableArray arrayWithArray:self.entries];
    [newArray removeObject:entry];
    self.entries = newArray;
}

-(void)loadFromDefaults{
    NSArray *entryDictionaries = [[NSUserDefaults standardUserDefaults] objectForKey:entryListKey];
    
    NSMutableArray *entries = [NSMutableArray new];
    for (NSDictionary *entry in entryDictionaries) {
        [entries addObject:[[ESEntry alloc] initWithDictionary:entry]];
    }
    self.entries = entries;
}

@end


    

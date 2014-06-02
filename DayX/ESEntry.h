//
//  ESEntry.h
//  Entries
//
//  Created by Caleb Hicks on 5/31/14.
//  Copyright (c) 2014 DevMountain. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ESEntry : NSObject

@property (strong, nonatomic) NSDate *timeStamp;
@property (strong, nonatomic) NSString *title;
@property (strong, nonatomic) NSString *entry;

- (NSDictionary *)entryDictionary;
- (id)initWithDictionary:(NSDictionary *)dictionary;

@end

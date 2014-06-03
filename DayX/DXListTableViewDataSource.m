//
//  DXListTableViewDataSource.m
//  DayX
//
//  Created by Caleb Hicks on 5/31/14.
//  Copyright (c) 2014 DevMountain. All rights reserved.
//

#import "DXListTableViewDataSource.h"
#import "ESEntryController.h"

@interface DXListTableViewDataSource ()

@property (nonatomic, strong) UITableView *tableView;

@end


@implementation DXListTableViewDataSource

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:entryListCellIdentifier forIndexPath:indexPath];
    
    ESEntry *entry = [ESEntryController sharedInstance].entries[indexPath.row];
    
    cell.textLabel.text = entry.title;
    
    cell.detailTextLabel.text = entry.entry;
    
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    //The numberOfRows should return the number of entries in the EntryController sharedInstance

    NSInteger rowsInSection = [[ESEntryController sharedInstance].entries count];
    return rowsInSection;
    
}

- (void)registerTableView:(UITableView *)tableView {
    self.tableView = tableView;
    [tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:entryListCellIdentifier];
}


@end

//
//  DXListViewController.m
//  DayX
//
//  Created by Caleb Hicks on 5/31/14.
//  Copyright (c) 2014 DevMountain. All rights reserved.
//

#import "DXListViewController.h"
#import "DXListTableViewDataSource.h"
#import "ESEntryController.h"
#import "DXEntryViewController.h"

@interface DXListViewController ()

@property UITableView *tableView;
@property DXListTableViewDataSource *dataSource;

@end

@implementation DXListViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = @"Entries";

    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds];
    
    self.dataSource = [DXListTableViewDataSource new];
    
    [self.dataSource registerTableView:self.tableView];
    self.tableView.dataSource = self.dataSource;
    self.tableView.delegate = self;
    
    [self.tableView reloadData];
        
    [self.view addSubview:self.tableView];
    
    UIBarButtonItem *addEntryButton = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(newEntry)];
    
    self.navigationItem.rightBarButtonItem = addEntryButton;

}

- (void)newEntry
{
    ESEntry *entry = [ESEntry new];
    [[ESEntryController sharedInstance] addEntry:entry];
    
    DXEntryViewController *entryView = [[DXEntryViewController alloc]init];
    
    entryView.entry = entry;
    
    [self.navigationController pushViewController:entryView animated:YES];
    
}

- (void)viewWillAppear:(BOOL)animated{
    
    // todo: call synchronize on the entryController
    
    [self.tableView reloadData];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

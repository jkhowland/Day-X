//
//  DXEntryViewController.m
//  DayX
//
//  Created by Caleb Hicks on 5/31/14.
//  Copyright (c) 2014 DevMountain. All rights reserved.
//

#import "DXEntryViewController.h"
#import "ESEntry.h"
#import "ESEntryController.h"

@interface DXEntryViewController ()

@property (weak, nonatomic) IBOutlet UITextField *entryTextField;
@property (weak, nonatomic) IBOutlet UITextView *entryTextView;

@end

@implementation DXEntryViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:@"DXEntryViewController" bundle:nil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    // update the entryTitleField to the title of the self.entry
    
    self.entryTextField.text = self.entry.title;
    
    // update the entryTextView to the entry of self.entry

    self.entryTextView.text = self.entry.entry;
    
    // if there's no timestamp, add the current time
    
    if (!self.entry.timeStamp){
        self.entry.timeStamp = [NSDate date];
    }
    
    self.entryTextField.delegate = self;
    self.entryTextView.delegate = self;
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)textViewDidChange:(UITextView *)textView{
    self.entry.entry = textView.text;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return YES;
}

- (BOOL)textFieldShouldEndEditing:(UITextField *)textField{
    self.entry.title = textField.text;
    return YES;
}

- (void)viewWillDisappear:(BOOL)animated{
    
   // [[ESEntryController sharedInstance] addEntry:self.entry];
    
}


@end

//
//  DXEntryViewController.h
//  DayX
//
//  Created by Caleb Hicks on 5/31/14.
//  Copyright (c) 2014 DevMountain. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ESEntry.h"

@interface DXEntryViewController : UIViewController <UITextFieldDelegate, UITextViewDelegate>

@property ESEntry *entry;

@end

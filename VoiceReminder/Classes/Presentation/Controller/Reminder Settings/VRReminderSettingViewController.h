//
//  VRReminderSettingViewController.h
//  VoiceReminder
//
//  Created by GemCompany on 1/11/15.
//  Copyright (c) 2015 Owner. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CircleProgressView.h"
typedef NS_ENUM(NSInteger, REMINDER_SETTING_TYPE) {
    REMINDER_SETTING_TYPE_NAME          = 0,
    REMINDER_SETTING_TYPE_REPEAT        = 1,
    REMINDER_SETTING_TYPE_ALERT         = 2,
    REMINDER_SETTING_TYPE_SOUND         = 3
};

@interface VRReminderSettingViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITableView *settingTableview;
@property (nonatomic, strong) NSURL *audioRecordingURL;
@property (weak, nonatomic) IBOutlet UIDatePicker *datePicker;

@end

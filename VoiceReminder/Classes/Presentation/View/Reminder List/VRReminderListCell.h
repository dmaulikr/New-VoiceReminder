//
//  TableViewCell.h
//  VoiceReminder
//
//  Created by GemCompany on 3/11/15.
//  Copyright (c) 2015 Owner. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <SWTableViewCell.h>
@interface VRReminderListCell : SWTableViewCell
@property (nonatomic, strong) UILabel *name;
@property (nonatomic, strong) UILabel *timeReminder;
@property (nonatomic, strong) UIView *lineSeparate;
@property (nonatomic, strong) UISwitch *switchButton;
@property (nonatomic, copy) void(^pressEditButton)(id sender);
@property (nonatomic, copy) void(^changeSwitch)(id sender);
@end

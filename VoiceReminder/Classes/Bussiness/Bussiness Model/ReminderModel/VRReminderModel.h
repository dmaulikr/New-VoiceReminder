//
//  VRReminderModel.h
//  VoiceReminder
//
//  Created by GemCompany on 2/1/15.
//  Copyright (c) 2015 Owner. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseModel.h"
#import "Reminder.h"

@interface VRReminderModel : BaseModel
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *urlSound;
@property (nonatomic, strong) NSString *nameOfSound;
@property (nonatomic, strong) NSString *timeReminder;
@property (nonatomic, assign) NSMutableArray *listRepeat;
@property (nonatomic, assign) ALERT_TYPE alertReminder;
@property (nonatomic, assign) BOOL isActive;
@property (nonatomic, strong) Reminder *entity;
- (instancetype)initWithEntity:(Reminder *)entity;
@end

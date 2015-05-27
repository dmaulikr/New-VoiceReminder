//
//  VRReminderMapping.m
//  VoiceReminder
//
//  Created by GemCompany on 2/1/15.
//  Copyright (c) 2015 Owner. All rights reserved.
//

#import "VRReminderMapping.h"
#import "NSManagedObject+voiceReminder.h"
#import "VRCommon.h"
#import "VRRepeatModel.h"
#import "VRRepeatMapping.h"
#import "Photo.h"
#import "VRSoundModel.h"
#import "VRSoundMapping.h"

@implementation VRReminderMapping
+ (Reminder*)entityFromModel:(VRReminderModel *)model inContext:(NSManagedObjectContext *)context {
    Reminder *entity = [Reminder entityWithUuid:model.uuid inContext:context];
    entity.name = model.name;
    entity.alertReminder = [NSNumber numberWithInteger:model.alertReminder];
    entity.timeReminder = [[VRCommon commonDateTimeFormat] dateFromString:model.timeReminder];
    entity.createdDate = model.createdDate;
    entity.isActive = [NSNumber numberWithBool:YES];
    entity.notes = model.notes;
    
    [entity removeRepeats:entity.repeats];
    for (VRRepeatModel *object in model.repeats) {
        [entity addRepeatsObject:[VRRepeatMapping entityFromModel:object inContext:context]];
    }
    
    [entity removeSound:entity.sound];
    for (VRSoundModel *soundModel in model.soundModels) {
        [entity addSoundObject:[VRSoundMapping entityFromModel:soundModel inContext:context]];
    }
    
    [entity removePhotos:entity.photos];
    for (NSString *url in model.photoList) {
        Photo * photo = [Photo MR_createInContext:context];
        photo.uuid = [NSUUID UUID].UUIDString;
        photo.url = url;
        photo.index = @([model.photoList indexOfObject:url]);
        [entity addPhotosObject:photo];
    }
    return entity;
}


@end

//
//  VRCommon.m
//  VoiceReminder
//
//  Created by GemCompany on 1/11/15.
//  Copyright (c) 2015 Owner. All rights reserved.
//

#import "VRCommon.h"
static NSDateFormatter *formatDate = nil;
static NSDateFormatter *formatDateTime = nil;
static NSDateFormatter *formatMonthYear = nil;
static NSDateFormatter *formatYear = nil;

static NSDateFormatter *fm = nil;

@implementation VRCommon

+ (NSString *)formatDateAndTimeFromDate:(NSDate *)date {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"MMM dd, yyyy HH:mm"];
    NSString *stringFromDate = [dateFormatter stringFromDate:date];
    return stringFromDate;
}

+ (NSDate *)dateFromString:(NSString *)dateString {
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:@"MMM dd, yyyy HH:mm"];
    NSDate *date = [dateFormat dateFromString:dateString];
    return date;
}

+ (NSDate *)localDateFromUnixTime:(NSNumber *)unixTime {
    if ([unixTime isEqual:[NSNull null]] || !unixTime) {
        return nil;
    }
    else // because respond server calculate in miliseconds so we need divide for 1000.0
        return [NSDate dateWithTimeIntervalSince1970:unixTime.longLongValue / 1000.0];
}

+ (double)unixTimeFromDate:(NSDate *)date {
    if (!date) {
        return 0;
    }
    return [date timeIntervalSince1970];
}

+ (double)unixTimeMiliSecondFromDate:(NSDate *)date{
    if (!date) {
        return 0;
    }
    return [date timeIntervalSince1970] *1000;
}

+ (NSString *)commonFormatFromDate:(NSDate *)date {
    if (!fm) {
        fm  = [[NSDateFormatter alloc] init];
        [fm setTimeStyle:NSDateFormatterNoStyle];
        [fm setDateStyle:NSDateFormatterMediumStyle];
        [fm setLocale:[NSLocale currentLocale]];
    }
    return [fm stringFromDate:date];
}

+ (NSString *)commonFormatTimeFromDate:(NSDate *)date
{
    NSDateFormatter * formatterDate = [[NSDateFormatter alloc] init];
    [formatterDate setTimeStyle:NSDateFormatterShortStyle];
    [formatterDate setDateStyle:NSDateFormatterNoStyle];
    [formatterDate setLocale:[NSLocale currentLocale]];
    return [formatterDate stringFromDate:date];
}

+ (NSDateFormatter *)commonDateTimeFormat
{
    if (!formatDateTime) {
        formatDateTime  = [[NSDateFormatter alloc] init];
        [formatDateTime setTimeStyle:NSDateFormatterShortStyle];
        [formatDateTime setDateStyle:NSDateFormatterMediumStyle];
        
        [formatDateTime setLocale:[NSLocale currentLocale]];
    }
    return formatDateTime;
}

+ (NSDateFormatter *)commonDateFormat {
    if (!fm) {
        fm  = [[NSDateFormatter alloc] init];
        [fm setTimeStyle:NSDateFormatterNoStyle];
        [fm setDateStyle:NSDateFormatterMediumStyle];
        [fm setLocale:[NSLocale currentLocale]];
    }
    return fm;
}

+ (NSString *)commonFormatFromDateTime:(NSDate *)date {
    if (!formatDateTime) {
        formatDateTime  = [[NSDateFormatter alloc] init];
        [formatDateTime setTimeStyle:NSDateFormatterShortStyle];
        [formatDateTime setDateStyle:NSDateFormatterMediumStyle];
        
        [formatDateTime setLocale:[NSLocale currentLocale]];
    }
    return [formatDateTime stringFromDate:date];
}

+ (NSString *)commonFormatFromMonthYear:(NSDate *)date
{
    if (!formatMonthYear) {
        formatMonthYear  = [[NSDateFormatter alloc] init];
        NSString *mothFormat = [NSDateFormatter dateFormatFromTemplate:@"yMMM" options:0 locale:[NSLocale currentLocale]];
        [formatMonthYear setDateFormat:mothFormat];
        
    }
    return [formatMonthYear stringFromDate:date];
}

+ (NSString *)commonFormatFromYear:(NSDate *)date
{
    if (!formatYear) {
        formatYear  = [[NSDateFormatter alloc] init];
        NSString *yearFormat = [NSDateFormatter dateFormatFromTemplate:@"y" options:0 locale:[NSLocale currentLocale]];
        [formatYear setDateFormat:yearFormat];
    }
    return [formatYear stringFromDate:date];
}


+ (NSSortDescriptor *)sortDescriptorByCreatedDate
{
    return [NSSortDescriptor sortDescriptorWithKey:@"createdDate" ascending:NO];
}
@end


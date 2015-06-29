//
//  IASKSettingsStore.m
//  http://www.inappsettingskit.com
//
//  Copyright (c) 2010:
//  Luc Vandal, Edovia Inc., http://www.edovia.com
//  Ortwin Gentz, FutureTap GmbH, http://www.futuretap.com
//  Marc-Etienne M.Léveillé, Edovia Inc., http://www.edovia.com
//  All rights reserved.
// 
//  It is appreciated but not required that you give credit to Luc Vandal and Ortwin Gentz, 
//  as the original authors of this code. You can give credit in a blog post, a tweet or on 
//  a info page of your app. Also, the original authors appreciate letting them know if you use this code.
//
//  This code is licensed under the BSD license that is available at: http://www.opensource.org/licenses/bsd-license.php
//

#import "IASKSettingsStore.h"

@implementation IASKAbstractSettingsStore

- (void)setObject:(id)value forKey:(NSString*)key {
    [NSException raise:@"Unimplemented"
                format:@"setObject:forKey: must be implemented in subclasses of IASKAbstractSettingsStore"];
}

- (id)objectForKey:(NSString*)key {
    [NSException raise:@"Unimplemented"
                format:@"objectForKey: must be implemented in subclasses of IASKAbstractSettingsStore"];
    return nil;
}

- (void) removeObjectForKey:(NSString *) key
{
    [NSException raise:@"Unimplemented"
                format:@"removeObjectForKey: must be implemented in subclasses of IASKAbstractSettingsStore"];
}

- (void)setBool:(BOOL)value forKey:(NSString*)key {
    [self setObject:[NSNumber numberWithBool:value] forKey:key];
}

- (void)setFloat:(float)value forKey:(NSString*)key {
    [self setObject:[NSNumber numberWithFloat:value] forKey:key];
}

- (void)setInteger:(NSInteger)value forKey:(NSString*)key {
    [self setObject:[NSNumber numberWithInteger:value] forKey:key];
}

- (void)setDouble:(double)value forKey:(NSString*)key {
    [self setObject:[NSNumber numberWithDouble:value] forKey:key];
}

- (BOOL)boolForKey:(NSString*)key {
    return [[self objectForKey:key] boolValue];
}

- (float)floatForKey:(NSString*)key {
    return [[self objectForKey:key] floatValue];
}
- (NSInteger)integerForKey:(NSString*)key {
    return [[self objectForKey:key] integerValue];
}

- (double)doubleForKey:(NSString*)key {
    return [[self objectForKey:key] doubleValue];
}

- (NSArray *)arrayForKey:(NSString*)key {
    NSObject * obj = [self objectForKey:key];
    if ([obj isKindOfClass:[NSArray class]]) {
        return (NSArray *) obj;
    }
    return nil;
}

- (NSString *)stringForKey:(NSString*)key {
    NSObject * obj = [self objectForKey:key];
    if ([obj isKindOfClass:[NSString class]]) {
        return (NSString *) obj;
    } else if ([obj respondsToSelector:@selector(stringValue)]) {
        return [obj performSelector:@selector(stringValue)];
    }
    return [NSString stringWithFormat:@"%@", obj];
}

- (BOOL)synchronize {
    return NO;
}

@end

//
//  IASKSettingsStoreFile.m
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

#import "IASKSettingsStoreFile.h"

@interface IASKSettingsStoreFile() {
    NSMutableDictionary * _dict;
}

@end

@implementation IASKSettingsStoreFile

- (id)initWithPath:(NSString*)path {
    if((self = [super init])) {
        _filePath = [path copy];
        _dict = [[NSMutableDictionary alloc] initWithContentsOfFile:path];
        if(_dict == nil) {
            _dict = [[NSMutableDictionary alloc] init];
        }
    }
    return self;
}

- (void)setObject:(id)value forKey:(NSString *)key {
    [_dict setObject:value forKey:key];
}

- (id)objectForKey:(NSString *)key {
    return [_dict objectForKey:key];
}

- (void) removeObjectForKey:(NSString *) key {
    [_dict removeObjectForKey:key];
}

-(void) delayedSynchronize {
    [_dict writeToFile:_filePath atomically:YES];
}
- (BOOL)synchronize {
    [NSObject cancelPreviousPerformRequestsWithTarget:self selector:@selector(delayedSynchronize) object:nil];
    [self performSelector:@selector(delayedSynchronize) withObject:nil afterDelay:0.2];
    
    return YES;
}

@end

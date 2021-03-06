//
//  Gerne.m
//  YourSounds
//
//  Created by Duong Nguyen on 8/21/15.
//  Copyright (c) 2015 Duong Nguyen. All rights reserved.
//

#import "Gerne.h"

@implementation Gerne

+ (NSString *)primaryKey {
    return @"index";
}
+(Gerne *) gerneFromDict:(NSDictionary *)gerneDictionary{
    Gerne *gerne = [[Gerne alloc]init];
    gerne.gerneName = [gerneDictionary valueForKeyPath:@"name.default"];
    gerne.gerneID = [gerneDictionary objectForKey:@"id"];
    return gerne;
}

@end

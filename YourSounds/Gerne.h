//
//  Gerne.h
//  YourSounds
//
//  Created by Duong Nguyen on 8/21/15.
//  Copyright (c) 2015 Duong Nguyen. All rights reserved.
//

#import <Realm/Realm.h>

@interface Gerne : RLMObject

@property NSInteger index;
@property NSString *gerneName;
@property NSString *gerneID;
+(Gerne *) gerneFromDict:(NSDictionary *)gerneDictionary;

@end

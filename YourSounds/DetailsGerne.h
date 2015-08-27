//
//  DetailsGerne.h
//  YourSounds
//
//  Created by Duong Nguyen on 8/27/15.
//  Copyright (c) 2015 Duong Nguyen. All rights reserved.
//

#import <Realm/Realm.h>

@interface DetailsGerne : RLMObject

@property NSInteger index;
@property NSString *detailsName;
@property NSString *detailsURL;
+(DetailsGerne *) gerneFromDict:(NSDictionary *)gerneDictionary;
@end

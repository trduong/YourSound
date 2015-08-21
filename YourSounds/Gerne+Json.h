//
//  Gerne+Json.h
//  YourSounds
//
//  Created by Duong Nguyen on 8/21/15.
//  Copyright (c) 2015 Duong Nguyen. All rights reserved.
//

#import "Gerne.h"

@interface Gerne (Json)
+(Gerne *) gerneFromDict:(NSDictionary *)gerneDictionary;

@end

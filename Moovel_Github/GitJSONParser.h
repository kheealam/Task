//
//  TMDBJSONParser.h
//  TestApp
//
//  Created by Khizar Alam on 7/13/17.
//  Copyright © 2017 Khizar Alam. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "User.h"
#import "Constants.h"
@interface GitJSONParser : NSObject

-(NSArray*)parseUsers:(NSArray*)data;
-(User*)parseUser:(NSDictionary*)data;

@end

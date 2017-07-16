//
//  TMDBAPIService.h
//  TestApp
//
//  Created by Khizar Alam on 7/13/17.
//  Copyright © 2017 Khizar Alam. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GitJSONParser.h"
#import "Constants.h"
#import "AFNetworkingGateway.h"
@interface GitAPIService : NSObject

-(void)getDevsWithLanguage:(NSString*)language andPageNo:(int)page success:( void ( ^ )( NSArray * movies,int totalPages) )success withFailure:( void ( ^ )(  NSError *error ) )fail;
-(void)getUserByUsername:(NSString*)username success:( void ( ^ )( User * user) )success withFailure:( void ( ^ )(  NSError *error ) )fail;
@end

//
//  NetworkGatewayProtocol.h
//  TestApp
//
//  Created by Khizar Alam on 7/13/17.
//  Copyright © 2017 Khizar Alam. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol NetworkGatewayProtocol <NSObject>

-(void)GET:(NSString*)URL withSuccess:( void ( ^ )(  id responseObject ) )succcess withFailure:( void ( ^ )(  NSError *error ) )fail;
-(void)POST:(NSString*)URL parameters:(NSDictionary*)params withSuccess:( void ( ^ )(  id responseObject ) )succcess withFailure:( void ( ^ )(  NSError *error ) )fail;

@end

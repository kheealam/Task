//
//  AFNetworkingGateway.m
//  TestApp
//
//  Created by Khizar Alam on 7/13/17.
//  Copyright © 2017 Khizar Alam. All rights reserved.
//

#import "AFNetworkingGateway.h"
#import <AFNetworking.h>
@implementation AFNetworkingGateway

-(void)GET:(NSString*)URL withSuccess:( void ( ^ )(  id responseObject ) )succcess withFailure:( void ( ^ )(  NSError *error ) )fail{

    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    [manager GET:URL parameters:nil progress:nil success:^(NSURLSessionTask *task, id responseObject) {
        succcess(responseObject);
    } failure:^(NSURLSessionTask *operation, NSError *error) {
        fail(error);
    }];
     
}
-(void)POST:(NSString*)URL parameters:(NSDictionary*)params withSuccess:( void ( ^ )(  id responseObject ) )succcess withFailure:( void ( ^ )(  NSError *error ) )fail{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager GET:URL parameters:nil progress:nil success:^(NSURLSessionTask *task, id responseObject) {
        succcess(responseObject);
    } failure:^(NSURLSessionTask *operation, NSError *error) {
        fail(error);
    }];

}
     

@end

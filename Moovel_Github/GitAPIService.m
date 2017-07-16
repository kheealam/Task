//
//  TMDBAPIService.m
//  TestApp
//
//  Created by Khizar Alam on 7/13/17.
//  Copyright © 2017 Khizar Alam. All rights reserved.
//

#import "GitAPIService.h"

@implementation GitAPIService

-(void)getDevsWithLanguage:(NSString*)language andPageNo:(int)page success:( void ( ^ )( NSArray * movies,int totalPages) )success withFailure:( void ( ^ )(  NSError *error ) )fail{
    
    GitJSONParser * parser=[[GitJSONParser alloc] init];
    AFNetworkingGateway * gateway=[[AFNetworkingGateway alloc] init];
    
    NSString* url=[NSString stringWithFormat:@"%@%@%@&page=%d&per_page=10&sort=username&ord=asc",BASE_URL,DEVELOPERS_BY_LANGUAGE,language,page];
    
    [gateway GET:url withSuccess:^(id responseObject) {
        
        NSDictionary* response=responseObject;
        NSArray* array=response[@"items"];
        int totalPages=(int)(ceil([response[@"total_count"] intValue]/10.0));
        NSArray* usersArray=[parser parseUsers:array];
        success(usersArray,totalPages);
    } withFailure:^(NSError *error) {
        fail(error);
    }];
}
-(void)getUserByUsername:(NSString*)username success:( void ( ^ )( User * user) )success withFailure:( void ( ^ )(  NSError *error ) )fail{
    
    GitJSONParser * parser=[[GitJSONParser alloc] init];
    AFNetworkingGateway * gateway=[[AFNetworkingGateway alloc] init];
    
    NSString* url=[NSString stringWithFormat:@"%@%@%@",BASE_URL,SINGLE_USER,username];
    
    [gateway GET:url withSuccess:^(id responseObject) {
        
        NSDictionary* response=responseObject;
        User* user=[parser parseUser:response];
        success(user);
    } withFailure:^(NSError *error) {
        fail(error);
    }];
}



@end

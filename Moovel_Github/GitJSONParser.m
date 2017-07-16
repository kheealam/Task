//
//  TMDBJSONParser.m
//  TestApp
//
//  Created by Khizar Alam on 7/13/17.
//  Copyright © 2017 Khizar Alam. All rights reserved.
//

#import "GitJSONParser.h"
@implementation GitJSONParser
-(NSArray*)parseUsers:(NSArray*)data{

    NSMutableArray* users=[[NSMutableArray alloc] init];
    
    for(int i=0;i<data.count;++i){
    
        [users addObject:[self parseUser:data[i]]];
    }
    return users;

}
-(User*)parseUser:(NSDictionary*)data{
    
    User * user=[[User alloc] init];
    
    user.username=data[@"login"];
    user.avatarUrl=data[@"avatar_url"];
    user.name=data[@"name"];
    user.email=data[@"email"]==[NSNull null]?@"-":data[@"email"];
    NSDateFormatter * formatter=[[NSDateFormatter alloc] init];
    [formatter setDateFormat:PARSING_DATE_FORMAT];
    user.createdOn=[formatter dateFromString:data[@"created_at"]];
    return user;
}
@end

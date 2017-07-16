//
//  User.h
//  Moovel_Github
//
//  Created by Khizar Alam on 7/14/17.
//  Copyright © 2017 Khizar Alam. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface User : NSObject
/*
 {
 "login": "javagaorui5944",
 "id": 12690899,
 "avatar_url": "https://avatars4.githubusercontent.com/u/12690899?v=4",
 "gravatar_id": "",
 "url": "https://api.github.com/users/javagaorui5944",
 "html_url": "https://github.com/javagaorui5944",
 "followers_url": "https://api.github.com/users/javagaorui5944/followers",
 "following_url": "https://api.github.com/users/javagaorui5944/following{/other_user}",
 "gists_url": "https://api.github.com/users/javagaorui5944/gists{/gist_id}",
 "starred_url": "https://api.github.com/users/javagaorui5944/starred{/owner}{/repo}",
 "subscriptions_url": "https://api.github.com/users/javagaorui5944/subscriptions",
 "organizations_url": "https://api.github.com/users/javagaorui5944/orgs",
 "repos_url": "https://api.github.com/users/javagaorui5944/repos",
 "events_url": "https://api.github.com/users/javagaorui5944/events{/privacy}",
 "received_events_url": "https://api.github.com/users/javagaorui5944/received_events",
 "type": "User",
 "site_admin": false,
 "score": 13.483638
 },
 */


@property NSString * username;
@property NSString * avatarUrl;
@property NSString * email;
@property NSString * name;
@property NSDate * createdOn;

@end

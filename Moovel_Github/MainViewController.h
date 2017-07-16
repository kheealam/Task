//
//  ViewController.h
//  Moovel_Github
//
//  Created by Khizar Alam on 7/13/17.
//  Copyright © 2017 Khizar Alam. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GitAPIService.h"
#import "UserTableViewCell.h"
#import "DetailsViewController.h"
#import <SDWebImage/UIImageView+WebCache.h>
@interface MainViewController : UIViewController <UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property NSMutableArray* users;
@property int pageCount;
@property int totalPages;

@property void ( ^success )( NSArray * users,int totalPages);
@property void ( ^failure )( NSError *error);
@end


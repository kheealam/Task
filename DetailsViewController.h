//
//  DetailsViewController.h
//  Moovel_Github
//
//  Created by Khizar Alam on 7/16/17.
//  Copyright © 2017 Khizar Alam. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GitAPIService.h"
#import <SDWebImage/UIImageView+WebCache.h>
@interface DetailsViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;
@property (weak, nonatomic) IBOutlet UIImageView *image;
@property (weak, nonatomic) IBOutlet UILabel *email;
@property (weak, nonatomic) IBOutlet UILabel * createdOn;
@property (weak, nonatomic) IBOutlet UILabel *name;
@property User * user;
@property GitAPIService * apiService;

@property void ( ^success )( User * user);
@property void ( ^failure )( NSError *error);

@end

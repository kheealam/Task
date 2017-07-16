//
//  MovieTableViewCell.h
//  TestApp
//
//  Created by Khizar Alam on 4/22/17.
//  Copyright © 2017 Khizar Alam. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "User.h"
@interface UserTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *image;
@property (weak, nonatomic) IBOutlet UILabel *title;

-(void)initialize:(User*)user;

@end

//
//  MovieTableViewCell.m
//  TestApp
//
//  Created by Khizar Alam on 4/22/17.
//  Copyright © 2017 Khizar Alam. All rights reserved.
//

#import "UserTableViewCell.h"

@implementation UserTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
-(void)initialize:(User*)user{

    self.title.text=user.username;

}
@end

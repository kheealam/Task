//
//  DetailsViewController.m
//  Moovel_Github
//
//  Created by Khizar Alam on 7/16/17.
//  Copyright © 2017 Khizar Alam. All rights reserved.
//

#import "DetailsViewController.h"
#import "GitAPIService.h"
@interface DetailsViewController ()

@end

@implementation DetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.apiService=[[GitAPIService alloc] init];
    self.title=self.user.username;
    
    
    __weak DetailsViewController * self_=self;
    self.success=^(User *user) {
        self_.user=user;
        dispatch_async(dispatch_get_main_queue(), ^{
            [self_.image sd_setImageWithURL:[NSURL URLWithString:user.avatarUrl]
                          placeholderImage:[UIImage imageNamed:PLACEHOLDER_IMAGE]];
            self_.name.text=[NSString stringWithFormat:@"%@ %@",NAME_PLACEHOLDER,user.name];
            self_.email.text=[NSString stringWithFormat:@"%@ %@",EMAIL_PLACEHOLDER,user.email];
            NSDateFormatter * formatter=[[NSDateFormatter alloc] init];
            [formatter setDateFormat:DATE_FORMAT];
            
            NSString * str=[formatter stringFromDate:user.createdOn];
            self_.createdOn.text=[NSString stringWithFormat:@"%@ %@",CREATED_AT_PLACEHOLDER,str];
            
        });
        
        [self_.activityIndicator stopAnimating];
    };
    self.failure = ^(NSError *error) {
        [self_.activityIndicator stopAnimating];
    };
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
    // Dispose of any resources that can be recreated.
}

- (void)viewDidAppear:(BOOL)animated{
    
    [self.activityIndicator startAnimating];
    [self.apiService getUserByUsername:self.user.username success:self.success withFailure:self.failure];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

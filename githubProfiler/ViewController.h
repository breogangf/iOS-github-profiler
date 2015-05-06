//
//  ViewController.h
//  httpGet
//
//  Created by Breogán González Fernández on 6/5/15.
//  Copyright (c) 2015 SetPay. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (strong, nonatomic) IBOutlet UITextField *TextFieldUsername;

@property (strong, nonatomic) IBOutlet UIButton *ButtonGet;

@property (strong, nonatomic) IBOutlet UILabel *LabelId;
@property (strong, nonatomic) IBOutlet UILabel *LabelName;
@property (strong, nonatomic) IBOutlet UILabel *LabelCompany;
@property (strong, nonatomic) IBOutlet UILabel *LabelWebsite;
@property (strong, nonatomic) IBOutlet UILabel *LabelLocation;
@property (strong, nonatomic) IBOutlet UILabel *LabelEmail;
@property (strong, nonatomic) IBOutlet UILabel *LabelPublicRepos;
@property (strong, nonatomic) IBOutlet UILabel *LabelHireable;
@property (strong, nonatomic) IBOutlet UILabel *LabelFollowers;
@property (strong, nonatomic) IBOutlet UILabel *LabelFollowing;
@property (strong, nonatomic) IBOutlet UILabel *LabelCreated;
@property (strong, nonatomic) IBOutlet UILabel *LabelUpdated;

@end


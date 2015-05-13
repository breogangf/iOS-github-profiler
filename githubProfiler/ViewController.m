//
//  ViewController.m
//  httpGet
//
//  Created by Breogán González Fernández on 6/5/15.
//  Copyright (c) 2015 SetPay. All rights reserved.
//

#import "ViewController.h"

@interface ViewController()
@property (nonatomic, strong) NSMutableData *responseData;
@end

@implementation ViewController

@synthesize responseData = _responseData;

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"viewdidload");
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismissKeyboard)];
    
    [self.view addGestureRecognizer:tap];
    
}

-(void)dismissKeyboard {
    [self.TextFieldUsername resignFirstResponder];
}

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response {
    NSLog(@"didReceiveResponse");
    [self.responseData setLength:0];
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
    [self.responseData appendData:data];
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error {
    NSLog(@"didFailWithError");
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection {
    
    // convert to JSON
    NSError *myError = nil;
    NSDictionary *res = [NSJSONSerialization JSONObjectWithData:self.responseData options:NSJSONReadingMutableLeaves error:&myError];
    
    // get Id
    id idValue = [res objectForKey:@"id"];
    NSString *idValueAsString = (NSString *)idValue;
    NSLog(@"id: %@", idValueAsString);
    self.LabelId.text = [NSString stringWithFormat:@"%@%@", @"Id: ", idValueAsString];
    
    // get Name
    id nameValue = [res objectForKey:@"name"];
    NSString *nameValueAsString = (NSString *)nameValue;
    NSLog(@"name: %@", nameValueAsString);
    self.LabelName.text = [NSString stringWithFormat:@"%@%@", @"Name: ", nameValueAsString];
    
    // get Company
    id companyValue = [res objectForKey:@"company"];
    NSString *companyValueAsString = (NSString *)companyValue;
    NSLog(@"company: %@", companyValueAsString);
    self.LabelCompany.text = [NSString stringWithFormat:@"%@%@", @"Company: ", companyValueAsString];
    
    // get Website
    id websiteValue = [res objectForKey:@"blog"];
    NSString *websiteValueAsString = (NSString *)websiteValue;
    NSLog(@"website: %@", websiteValueAsString);
    self.LabelWebsite.text = [NSString stringWithFormat:@"%@%@", @"Website: ", websiteValueAsString];
    
    // get Location
    id locationValue = [res objectForKey:@"location"];
    NSString *locationValueAsString = (NSString *)locationValue;
    NSLog(@"location: %@", locationValueAsString);
    self.LabelLocation.text = [NSString stringWithFormat:@"%@%@", @"Location: ", locationValueAsString];
    
    // get Email
    id emailValue = [res objectForKey:@"email"];
    NSString *emailValueAsString = (NSString *)emailValue;
    NSLog(@"email: %@", emailValueAsString);
    self.LabelEmail.text = [NSString stringWithFormat:@"%@%@", @"Email: ", emailValueAsString];
    
    // get Public repos
    id publicReposValue = [res objectForKey:@"public_repos"];
    NSString *publicReposValueAsString = (NSString *)publicReposValue;
    NSLog(@"public_repos: %@", publicReposValueAsString);
    self.LabelPublicRepos.text = [NSString stringWithFormat:@"%@%@", @"Public repos: ", publicReposValueAsString];
    
    // get Hireable
    id hireableValue = [res objectForKey:@"hireable"];
    NSString *hireableValueAsString = (NSString *)hireableValue;
    NSLog(@"hireable: %@", hireableValueAsString);
    self.LabelHireable.text = [NSString stringWithFormat:@"%@%@", @"Hireable: ", hireableValueAsString];
    
    // get Followers
    id followersValue = [res objectForKey:@"followers"];
    NSString *followersValueAsString = (NSString *)followersValue;
    NSLog(@"followers: %@", followersValueAsString);
    self.LabelFollowers.text = [NSString stringWithFormat:@"%@%@", @"Followers: ", followersValueAsString];
    
    // get Following
    id followingValue = [res objectForKey:@"following"];
    NSString *followingValueAsString = (NSString *)followingValue;
    NSLog(@"following: %@", followingValueAsString);
    self.LabelFollowing.text = [NSString stringWithFormat:@"%@%@", @"Following: ", followingValueAsString];
    
    // get Created
    id createdValue = [res objectForKey:@"created_at"];
    NSString *createdValueAsString = (NSString *)createdValue;
    NSLog(@"created_at: %@", createdValueAsString);
    self.LabelCreated.text = [NSString stringWithFormat:@"%@%@", @"Created: ", createdValueAsString];
    
    // get Updated
    id updatedValue = [res objectForKey:@"updated_at"];
    NSString *updatedValueAsString = (NSString *)updatedValue;
    NSLog(@"updated_at: %@", updatedValueAsString);
    self.LabelUpdated.text = [NSString stringWithFormat:@"%@%@", @"Updated: ", createdValueAsString];
    
}

- (void)viewDidUnload {
    [super viewDidUnload];
}

- (IBAction)GetButtonClicked:(id)sender {
    
    
    self.responseData = [NSMutableData data];
    
    NSString *url = [NSString stringWithFormat:@"%@%@", @"https://api.github.com/users/", self.TextFieldUsername.text];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:url]];
    [[NSURLConnection alloc] initWithRequest:request delegate:self];
}

@end

//
//  CustomTabBarController.m
//  WildKingdom
//
//  Created by Andrew Webb on 1/23/14.
//  Copyright (c) 2014 Andrew Webb. All rights reserved.
//

#import "CustomTabBarController.h"
#import "ViewController.h"

@interface CustomTabBarController ()

@end

@implementation CustomTabBarController

- (void)viewDidLoad
{
    [super viewDidLoad];
	UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    ViewController* lions = [storyboard instantiateViewControllerWithIdentifier:@"Animals"];
    ViewController* tigers = [storyboard instantiateViewControllerWithIdentifier:@"Animals"];
    ViewController* bears = [storyboard instantiateViewControllerWithIdentifier:@"Animals"];
    
    lions.navigationItem.title = @"Lions";
    lions.title = @"Lions";
    lions.searchURL = [NSURL URLWithString:@"http://api.flickr.com/services/rest/?method=flickr.photos.search&api_key=5570deb92144c385ceec70843e7bb90c&tags=lion&license=1%2C2%2C3%2C4%2C5%2C6&extras=url_q&per_page=10&page=1&format=json&nojsoncallback=1&auth_token=72157640078560496-58ab1b8f5d5882e2&api_sig=6690085bab82de89f7e2232772fe6846"];
    tigers.navigationItem.title = @"Tigers";
    tigers.title = @"Tigers";
    tigers.searchURL = [NSURL URLWithString:@"http://api.flickr.com/services/rest/?method=flickr.photos.search&api_key=5570deb92144c385ceec70843e7bb90c&tags=tiger&license=1%2C2%2C3%2C4%2C5%2C6&extras=url_q&per_page=10&page=1&format=json&nojsoncallback=1&auth_token=72157640078560496-58ab1b8f5d5882e2&api_sig=69ed8e076893a5b0a1363c6f919a9a2b"];
    bears.navigationItem.title = @"Bears";
    bears.title = @"Bears";
    bears.searchURL = [NSURL URLWithString:@"http://api.flickr.com/services/rest/?method=flickr.photos.search&api_key=5570deb92144c385ceec70843e7bb90c&tags=bear&license=1%2C2%2C3%2C4%2C5%2C6&extras=url_q&per_page=10&page=1&format=json&nojsoncallback=1&auth_token=72157640078560496-58ab1b8f5d5882e2&api_sig=38f919a91368bf9f67172df0832013b9"];
    
    NSArray* controllers = @[lions,tigers,bears];
    
    [self setViewControllers:controllers animated:YES];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

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
    lions.searchURL = [NSURL URLWithString:@"http://api.flickr.com/services/rest/?method=flickr.photos.search&api_key=269c07a66f7133fbfc8bcbb3c9c8d28e&tags=lion&license=1%2C2%2C3%2C4%2C5%2C6&extras=url_z&per_page=10&page=1&format=json&nojsoncallback=1&auth_token=72157640094105823-60fa5928df7d6c9a&api_sig=e4f6c8ad110f90d0f59ce291120c6302"];
    tigers.navigationItem.title = @"Tigers";
    tigers.title = @"Tigers";
    tigers.searchURL = [NSURL URLWithString:@"http://api.flickr.com/services/rest/?method=flickr.photos.search&api_key=269c07a66f7133fbfc8bcbb3c9c8d28e&tags=tiger&license=1%2C2%2C3%2C4%2C5%2C6&extras=url_z&per_page=10&page=1&format=json&nojsoncallback=1&auth_token=72157640094105823-60fa5928df7d6c9a&api_sig=01ac61711895c5ac22bf517d06af02a4"];
    bears.navigationItem.title = @"Bears";
    bears.title = @"Bears";
    bears.searchURL = [NSURL URLWithString:@"http://api.flickr.com/services/rest/?method=flickr.photos.search&api_key=5570deb92144c385ceec70843e7bb90c&tags=bear&license=1%2C2%2C3%2C4%2C5%2C6&extras=url_z&per_page=10&page=1&format=json&nojsoncallback=1&auth_token=72157640078560496-58ab1b8f5d5882e2&api_sig=bcc3f80b91b3a8a1eb801e5a5428b2ef"];
    
    NSArray* controllers = @[lions,tigers,bears];
    
    [self setViewControllers:controllers animated:YES];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

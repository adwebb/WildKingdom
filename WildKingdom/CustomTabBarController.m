//
//  CustomTabBarController.m
//  WildKingdom
//
//  Created by Andrew Webb on 1/23/14.
//  Copyright (c) 2014 Andrew Webb. All rights reserved.
//

#import "CustomTabBarController.h"
#import "ViewController.h"

@interface CustomTabBarController ()<UITabBarDelegate>

@end

@implementation CustomTabBarController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
	UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    ViewController* lions = [storyboard instantiateViewControllerWithIdentifier:@"Animals"];
    ViewController* tigers = [storyboard instantiateViewControllerWithIdentifier:@"Animals"];
    ViewController* bears = [storyboard instantiateViewControllerWithIdentifier:@"Animals"];
    
    lions.title = @"Lions";
    lions.tabBarItem.image = [UIImage imageNamed:@"lionicon2"];
    lions.searchURL = [NSURL URLWithString:@"http://api.flickr.com/services/rest/?method=flickr.photos.search&api_key=688e3c3cb5d57f1a49a8caaaacba3879&tags=lion&license=1%2C2%2C3%2C4%2C5%2C6&extras=url_n&per_page=10&page=1&format=json&nojsoncallback=1"];

    tigers.title = @"Tigers";
    tigers.tabBarItem.image = [UIImage imageNamed:@"tiger"];
    tigers.searchURL = [NSURL URLWithString:@"http://api.flickr.com/services/rest/?method=flickr.photos.search&api_key=688e3c3cb5d57f1a49a8caaaacba3879&tags=tiger&license=1%2C2%2C3%2C4%2C5%2C6&extras=url_n&per_page=10&page=1&format=json&nojsoncallback=1"];
    bears.title = @"Bears";
    bears.tabBarItem.image = [UIImage imageNamed:@"bear"];
    bears.searchURL = [NSURL URLWithString:@"http://api.flickr.com/services/rest/?method=flickr.photos.search&api_key=688e3c3cb5d57f1a49a8caaaacba3879&tags=bear&license=1%2C2%2C3%2C4%2C5%2C6&extras=url_n&per_page=10&page=1&format=json&nojsoncallback=1"];
    
    NSArray* controllers = @[lions,tigers,bears];
    
    [self setViewControllers:controllers animated:YES];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

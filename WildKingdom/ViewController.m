//
//  ViewController.m
//  WildKingdom
//
//  Created by Andrew Webb on 1/23/14.
//  Copyright (c) 2014 Andrew Webb. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UICollectionViewDataSource,UICollectionViewDelegate, UITabBarDelegate>
{
    NSArray* animals;
    __weak IBOutlet UICollectionView *animalCollectionView;
}
@end

@implementation ViewController
@synthesize searchURL;

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"grass.png"]];
	[self fetchImages];
}

-(void)fetchImages
{
    NSURLRequest* request = [NSURLRequest requestWithURL:searchURL];
    
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        animals = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&connectionError][@"photos"][@"photo"];
        [animalCollectionView reloadData];
    }];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 10;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell* cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"WildAnimalReuseID" forIndexPath:indexPath];
    
            //cell.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"tiger"]];
    cell.contentView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:animals[indexPath.row][@"url_q"]]]]];
    
    return cell;
}

@end

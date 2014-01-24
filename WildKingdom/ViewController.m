//
//  ViewController.m
//  WildKingdom
//
//  Created by Andrew Webb on 1/23/14.
//  Copyright (c) 2014 Andrew Webb. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UICollectionViewDataSource,UICollectionViewDelegate>
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

-(void)didRotateFromInterfaceOrientation:(UIInterfaceOrientation)fromInterfaceOrientation
{
    if (UIInterfaceOrientationIsPortrait(fromInterfaceOrientation))
    {
        [self prefersStatusBarHidden];
        UICollectionViewFlowLayout* horizontalFlow = [UICollectionViewFlowLayout new];
        horizontalFlow.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        horizontalFlow.itemSize = CGSizeMake(320, 240);
    
        animalCollectionView.collectionViewLayout = horizontalFlow;
    }else{
        UICollectionViewFlowLayout* verticalFlow = [UICollectionViewFlowLayout new];
        verticalFlow.scrollDirection = UICollectionViewScrollDirectionVertical;
        verticalFlow.itemSize = CGSizeMake(150, 150);
        
        animalCollectionView.collectionViewLayout = verticalFlow;
        
    }
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
    
    
    UIImageView* imageView = (UIImageView *)[cell viewWithTag:100];
    
    imageView.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:animals[indexPath.row][@"url_n"]]]];
    
    return cell;
}

@end
